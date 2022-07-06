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

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.mat"
        "rixcompmult.dynamic.lowp_mat2_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015708 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.lowp_mat2_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015709 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.mediump_mat2_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015710 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.mediump_mat2_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015711 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.highp_mat2_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015712 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.highp_mat2_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015713 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat2x3_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015714 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat2x3_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015715 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat2x3_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015716 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat2x3_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015717 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat2x3_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015718 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat2x3_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015719 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat2x4_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015720 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat2x4_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015721 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat2x4_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015722 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat2x4_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015723 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat2x4_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015724 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat2x4_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015725 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat3x2_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015726 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat3x2_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015727 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat3x2_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015728 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat3x2_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015729 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat3x2_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015730 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat3x2_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015731 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.mat"
        "rixcompmult.dynamic.lowp_mat3_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015732 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.lowp_mat3_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015733 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.mediump_mat3_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015734 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.mediump_mat3_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015735 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.highp_mat3_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015736 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.highp_mat3_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015737 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat3x4_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015738 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat3x4_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015739 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat3x4_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015740 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat3x4_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015741 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat3x4_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015742 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat3x4_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015743 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat4x2_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015744 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat4x2_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015745 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat4x2_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015746 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat4x2_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015747 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat4x2_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015748 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat4x2_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015749 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.lowp_mat4x3_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015750 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.lowp_mat4x3_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015751 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.mediump_mat4x3_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015752 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixco"
        "mpmult.dynamic.mediump_mat4x3_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015753 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.highp_mat4x3_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015754 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrixc"
        "ompmult.dynamic.highp_mat4x3_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015755 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.mat"
        "rixcompmult.dynamic.lowp_mat4_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015756 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.lowp_mat4_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015757 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.mediump_mat4_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015758 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matrix"
        "compmult.dynamic.mediump_mat4_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015759 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matr"
        "ixcompmult.dynamic.highp_mat4_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015760 end";
}

static HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.matri"
        "xcompmult.dynamic.highp_mat4_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015761 end";
}
