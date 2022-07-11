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
#include "../ActsDeqpgles30022TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021685 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021686 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021687 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021688 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021689 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021690 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021691 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021692 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021693 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021694 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021695 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021696 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021697 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021698 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021699 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021700 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021701 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021702 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021703 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021704 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021705 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021706 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021707 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021708 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021709 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021710 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021711 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021712 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021713 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021714 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021715 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021716 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021717 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021718 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021719 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021720 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021721 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021722 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021723 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021724 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021725 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021726 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021727 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021728 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021729 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021730 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021731 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021732 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021733 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021734 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021735 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021736 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.73",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021737 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.74",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021738 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.75",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021739 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.78",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021740 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.80",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021741 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.82",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021742 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.83",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021743 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.84",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021744 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.85",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021745 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.86",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021746 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.89",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021747 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.90",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021748 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.91",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021749 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.92",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021750 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.95",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021751 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.97",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021752 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.98",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021753 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".random.all_features.vertex.99",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021754 end";
}
