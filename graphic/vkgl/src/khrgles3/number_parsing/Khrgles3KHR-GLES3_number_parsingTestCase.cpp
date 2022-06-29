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
#include "../ActsKhrgles30005TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned_"
        "integer_above_signed_range_decimal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004062 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned"
        "_integer_above_signed_range_base8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004063 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned"
        "_integer_above_signed_range_base16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004064 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned_integer"
        "_smallest_value_above_signed_range_decimal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004065 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned_intege"
        "r_smallest_value_above_signed_range_base8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004066 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigned_integer"
        "_smallest_value_above_signed_range_base16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004067 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsi"
        "gned_integer_max_value_decimal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004068 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.uns"
        "igned_integer_max_value_base8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004069 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsi"
        "gned_integer_max_value_base16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004070 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigne"
        "d_integer_too_large_value_invalid",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004071 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.unsigne"
        "d_integer_negative_value_as_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004072 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.fl"
        "oat_out_of_range_as_infinity",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004073 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing."
        "float_out_of_range_as_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004074 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.float_no_limi"
        "t_on_number_of_digits_positive_exponent",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004075 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.float_no_limi"
        "t_on_number_of_digits_negative_exponent",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004076 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.float_slightly_o"
        "ut_of_range_exponent_as_positive_infinity",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004077 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.float"
        "_overflow_to_positive_infinity",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004078 end";
}

static HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.number_parsing.float"
        "_overflow_to_negative_infinity",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004079 end";
}
