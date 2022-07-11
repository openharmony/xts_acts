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

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001182, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001182 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor."
        "directive.version_is_less_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001182 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001182 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001183, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001183 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.d"
        "irective.version_is_less_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001183 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001183 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001184, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001184 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor."
        "directive.version_is_more_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001184 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001184 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001185, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001185 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.d"
        "irective.version_is_more_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001185 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001185 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001186, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001186 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.di"
        "rective.version_missing_es_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001186 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001186 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001187, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001187 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.dir"
        "ective.version_missing_es_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001187 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001187 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001188, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001188 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor."
        "directive.version_missing_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001188 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001188 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001189, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001189 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.d"
        "irective.version_missing_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001189 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001189 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001190, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001190 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.directi"
        "ve.version_not_first_statement_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001190 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001190 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001191, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001191 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.directiv"
        "e.version_not_first_statement_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001191 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001191 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001192, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001192 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.directi"
        "ve.version_not_first_statement_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001192 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001192 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001193, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001193 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.directiv"
        "e.version_not_first_statement_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001193 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001193 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001194, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001194 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.dire"
        "ctive.version_invalid_token_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001194 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001194 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001195, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001195 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.direc"
        "tive.version_invalid_token_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001195 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001195 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001196, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001196 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.dire"
        "ctive.version_invalid_token_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001196 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001196 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001197, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001197 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.direc"
        "tive.version_invalid_token_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001197 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001197 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001198, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001198 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor."
        "directive.invalid_version_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001198 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001198 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.d"
        "irective.invalid_version_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001199 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.d"
        "irective.additional_tokens_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001200 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.di"
        "rective.additional_tokens_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001201 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.dir"
        "ective.error_with_no_tokens_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001202 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preprocessor.dire"
        "ctive.error_with_no_tokens_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001203 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preproce"
        "ssor.directive.error_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001204 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.preproces"
        "sor.directive.error_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001205 end";
}
