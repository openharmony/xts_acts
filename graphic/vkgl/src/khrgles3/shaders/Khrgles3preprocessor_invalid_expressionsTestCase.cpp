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

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid"
        "_expressions.invalid_unary_expr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001282 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_"
        "expressions.invalid_unary_expr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001283 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid"
        "_expressions.invalid_binary_expr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001284 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_"
        "expressions.invalid_binary_expr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001285 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.inva"
        "lid_expressions.missing_expr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001286 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.inval"
        "id_expressions.missing_expr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001287 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.inval"
        "id_expressions.invalid_expr_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001288 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invali"
        "d_expressions.invalid_expr_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001289 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.inval"
        "id_expressions.invalid_expr_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001290 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invali"
        "d_expressions.invalid_expr_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001291 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.inval"
        "id_expressions.invalid_expr_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001292 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invali"
        "d_expressions.invalid_expr_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001293 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_"
        "expressions.unopened_parenthesis_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001294 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_e"
        "xpressions.unopened_parenthesis_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001295 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_"
        "expressions.unclosed_parenthesis_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001296 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.invalid_e"
        "xpressions.unclosed_parenthesis_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001297 end";
}
