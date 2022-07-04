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
#include "../ActsDeqpgles20010TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009882 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009883 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009884 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009885 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009886 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009887 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009888 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009889, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009889 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009889 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009889 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009890, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009890 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009890 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009890 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009891, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009891 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.texture.fragment.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009891 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009891 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009892, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009892 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009892 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009892 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009893, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009893 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009893 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009893 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009894, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009894 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009894 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009894 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009895, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009895 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009895 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009895 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009896, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009896 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009896 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009896 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009897, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009897 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009897 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009897 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009898, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009898 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009898 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009898 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009899, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009899 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009899 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009899 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009900, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009900 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009900 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009900 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009901, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009901 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009901 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009901 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009902, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009902 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009902 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009902 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009903, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009903 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009903 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009903 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009904, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009904 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009904 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009904 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009905, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009905 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009905 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009905 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009906, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009906 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009906 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009906 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009907, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009907 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009907 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009907 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009908, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009908 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009908 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009908 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009909, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009909 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009909 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009909 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009910, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009910 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009910 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009910 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009911, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009911 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009911 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009911 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009912, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009912 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009912 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009912 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009913, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009913 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009913 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009913 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009914, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009914 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009914 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009914 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009915, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009915 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009915 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009915 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009916, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009916 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009916 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009916 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009917, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009917 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009917 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009917 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009918, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009918 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009918 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009918 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009919, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009919 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009919 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009919 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009920, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009920 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009920 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009920 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009921, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009921 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009921 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009921 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009922, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009922 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009922 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009922 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009923, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009923 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009923 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009923 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009924, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009924 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009924 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009924 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009925, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009925 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009925 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009925 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009926, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009926 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009926 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009926 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009927 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009928 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009929 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009930 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009931 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009932 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009933 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009934 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.53",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009935 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.54",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009936 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009937 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009938, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009938 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009938 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009938 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009939, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009939 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009939 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009939 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009940, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009940 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009940 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009940 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009941, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009941 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009941 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009941 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009942, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009942 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009942 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009942 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009943, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009943 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009943 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009943 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009944, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009944 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009944 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009944 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009945, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009945 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009945 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009945 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009946, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009946 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009946 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009946 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009947, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009947 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009947 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009947 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009948, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009948 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.66",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009948 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009948 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009949, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009949 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009949 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009949 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009950, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009950 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009950 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009950 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009951 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009952 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009953 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.texture.fragment.72",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009954 end";
}
