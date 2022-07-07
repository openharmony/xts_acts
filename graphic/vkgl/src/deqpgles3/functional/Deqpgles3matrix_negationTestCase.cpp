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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30016TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.lowp_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015960 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015961 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.mediump_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015962 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015963 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.highp_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015964 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015965 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015966 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015967 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015968 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015969 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015970 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015971 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015972 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015973 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015974 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015975 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015976 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015977 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015978 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015979 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015980 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015981 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015982 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015983 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.lowp_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015984 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015985 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.mediump_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015986 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015987 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.highp_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015988 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015989 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015990 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015991 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015992 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015993 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015994 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015995 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015996 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015997 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015998 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015999 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016000 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016001 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016002 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.lowp_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016003 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016004 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "negation.mediump_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016005 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016006 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.highp_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016007 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.lowp_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016008 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.lowp_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016009 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.mediump_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016010 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".negation.mediump_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016011 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matr"
        "ix.negation.highp_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016012 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.negation.highp_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016013 end";
}
