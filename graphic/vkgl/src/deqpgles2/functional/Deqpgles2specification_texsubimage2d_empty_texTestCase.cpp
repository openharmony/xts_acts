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
#include "../ActsDeqpgles20011TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specif"
        "ication.texsubimage2d_empty_tex.a8_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010785 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifi"
        "cation.texsubimage2d_empty_tex.a8_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010786 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specif"
        "ication.texsubimage2d_empty_tex.l8_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010787 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifi"
        "cation.texsubimage2d_empty_tex.l8_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010788 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifi"
        "cation.texsubimage2d_empty_tex.la88_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010789 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.la88_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010790 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.rgb565_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010791 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgb565_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010792 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.rgb888_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010793 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgb888_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010794 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgba4444_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010795 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specificat"
        "ion.texsubimage2d_empty_tex.rgba4444_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010796 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgba5551_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010797 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specificat"
        "ion.texsubimage2d_empty_tex.rgba5551_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010798 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgba8888_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010799 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specificat"
        "ion.texsubimage2d_empty_tex.rgba8888_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010800 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgba16f_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010801 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specificat"
        "ion.texsubimage2d_empty_tex.rgba16f_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010802 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.rgb16f_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010803 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.rgb16f_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010804 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.la16f_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010805 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifica"
        "tion.texsubimage2d_empty_tex.la16f_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010806 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifi"
        "cation.texsubimage2d_empty_tex.l16f_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010807 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.l16f_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010808 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specifi"
        "cation.texsubimage2d_empty_tex.a16f_2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010809 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.specific"
        "ation.texsubimage2d_empty_tex.a16f_cube",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010810 end";
}
