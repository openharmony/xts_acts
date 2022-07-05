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

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".mipmap.2d.generate.a8_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010625 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".mipmap.2d.generate.a8_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010626 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipma"
        "p.2d.generate.a8_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010627 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipm"
        "ap.2d.generate.a8_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010628 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".mipmap.2d.generate.l8_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010629 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".mipmap.2d.generate.l8_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010630 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipma"
        "p.2d.generate.l8_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010631 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipm"
        "ap.2d.generate.l8_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010632 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "mipmap.2d.generate.la88_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010633 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "mipmap.2d.generate.la88_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010634 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap"
        ".2d.generate.la88_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010635 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipma"
        "p.2d.generate.la88_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010636 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.m"
        "ipmap.2d.generate.rgb565_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010637 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.m"
        "ipmap.2d.generate.rgb565_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010638 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap."
        "2d.generate.rgb565_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010639 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap"
        ".2d.generate.rgb565_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010640 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.m"
        "ipmap.2d.generate.rgb888_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010641 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.m"
        "ipmap.2d.generate.rgb888_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010642 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap."
        "2d.generate.rgb888_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010643 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap"
        ".2d.generate.rgb888_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010644 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba4444_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010645 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba4444_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010646 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap.2"
        "d.generate.rgba4444_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010647 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap."
        "2d.generate.rgba4444_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010648 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba5551_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010649 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba5551_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010650 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap.2"
        "d.generate.rgba5551_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010651 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap."
        "2d.generate.rgba5551_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010652 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba8888_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010653 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mi"
        "pmap.2d.generate.rgba8888_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010654 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap.2"
        "d.generate.rgba8888_non_square_fastest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010655 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.mipmap."
        "2d.generate.rgba8888_non_square_nicest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010656 end";
}
