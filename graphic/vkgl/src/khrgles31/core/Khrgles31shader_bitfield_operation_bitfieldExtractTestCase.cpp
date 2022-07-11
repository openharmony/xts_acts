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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uint_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000392 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uint_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000393 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uint_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000394 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uint_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000395 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec2_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000396 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec2_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000397 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec2_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000398 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec2_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000399 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec3_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000400 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec3_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000401 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec3_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000402 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec3_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000403 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec4_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000404 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec4_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000405 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec4_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000406 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.uvec4_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000407 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield"
        "_operation.bitfieldExtract.int_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000408 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield"
        "_operation.bitfieldExtract.int_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000409 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield"
        "_operation.bitfieldExtract.int_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000410 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield"
        "_operation.bitfieldExtract.int_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000411 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec2_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000412 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec2_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000413 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec2_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000414 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec2_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000415 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec3_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000416 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec3_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000417 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec3_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000418 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec3_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000419 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec4_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000420 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec4_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000421 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec4_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000422 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.shader_bitfield_"
        "operation.bitfieldExtract.ivec4_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000423 end";
}
