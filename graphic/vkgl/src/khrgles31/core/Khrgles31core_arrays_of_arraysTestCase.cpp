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
#include "../ActsKhrgles310003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002190, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002190 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.SizedDeclarationsPrimitive",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002190 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002190 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002191, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002191 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_array"
        "s.SizedDeclarationsStructTypes1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002191 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002191 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002192, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002192 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_array"
        "s.SizedDeclarationsStructTypes2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002192 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002192 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002193, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002193 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_array"
        "s.SizedDeclarationsStructTypes3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002193 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002193 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002194, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002194 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_array"
        "s.SizedDeclarationsStructTypes4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002194 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002194 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002195, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002195 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsTypenameStyle1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002195 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002195 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002196, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002196 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsTypenameStyle2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002196 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002196 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002197, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002197 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsTypenameStyle3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002197 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002197 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002198, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002198 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsTypenameStyle4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002198 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002198 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsTypenameStyle5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002199 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".SizedDeclarationsFunctionParams",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002200 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays."
        "sized_declarations_invalid_sizes1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002201 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays."
        "sized_declarations_invalid_sizes2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002202 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays."
        "sized_declarations_invalid_sizes3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002203 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays."
        "sized_declarations_invalid_sizes4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002204 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclConstructors1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002205 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002206, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002206 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclConstructors2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002206 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002206 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002207, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002207 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Constr"
        "uctorsAndUnsizedDeclUnsizedConstructors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002207 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002207 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002208, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002208 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays"
        ".ConstructorsAndUnsizedDeclConst",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002208 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002208 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002209, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002209 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Constr"
        "uctorsAndUnsizedDeclInvalidConstructors1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002209 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002209 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002210, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002210 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Constr"
        "uctorsAndUnsizedDeclInvalidConstructors2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002210 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002210 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Constr"
        "uctorsAndUnsizedDeclInvalidConstructors3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002211 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Constr"
        "uctorsAndUnsizedDeclInvalidConstructors4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002212 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Const"
        "ructorsAndUnsizedDeclConstructorSizing1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002213 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Const"
        "ructorsAndUnsizedDeclConstructorSizing2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002214 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Const"
        "ructorsAndUnsizedDeclStructConstructors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002215 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclUnsizedArrays1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002216 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclUnsizedArrays2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002217 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclUnsizedArrays3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002218 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arrays.Con"
        "structorsAndUnsizedDeclUnsizedArrays4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002219 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_a"
        "rrays.ExpressionsAssignment1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002220 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_a"
        "rrays.ExpressionsAssignment2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002221 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_a"
        "rrays.ExpressionsAssignment3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002222 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.ExpressionsTypeRestrictions1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002223 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.ExpressionsTypeRestrictions2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002224 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingScalar1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002225 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingScalar2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002226 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingScalar3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002227 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingScalar4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002228 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingArray1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002229 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingArray2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002230 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.ExpressionsIndexingArray3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002231 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.ExpressionsDynamicIndexing1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002232 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.ExpressionsDynamicIndexing2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002233 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.ExpressionsEquality1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002234 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.ExpressionsEquality2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002235 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of"
        "_arrays.ExpressionsLength1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002236 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of"
        "_arrays.ExpressionsLength2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002237 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of"
        "_arrays.ExpressionsLength3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002238 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.ExpressionsInvalid1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002239 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.ExpressionsInvalid2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002240 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.InteractionFunctionCalls1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002241 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.InteractionFunctionCalls2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002242 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002243 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002244 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002245 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002246 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002247 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionArgumentAliasing6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002248 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.InteractionUniforms1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002249 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_"
        "arrays.InteractionUniforms2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002250 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.InteractionUniformBuffers1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002251 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.InteractionUniformBuffers2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002252 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arr"
        "ays.InteractionUniformBuffers3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002253 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionInterfaceArrays1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002254 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionInterfaceArrays2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002255 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionInterfaceArrays3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002256 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.arrays_of_arra"
        "ys.InteractionInterfaceArrays4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002257 end";
}
