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

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.basic-binding-default",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002059 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_ind"
        "irect.basic-binding-zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002060 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.basic-binding-single",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002061 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_ind"
        "irect.basic-binding-multi",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002062 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.basic-binding-delete",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002063 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_in"
        "direct.basic-buffer-data",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002064 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.basic-buffer-subData",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002065 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indire"
        "ct.basic-buffer-getPointerv",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002066 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.basic-buffer-mapRange",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002067 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-buffer-flushMappedRange",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002068 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indire"
        "ct.basic-buffer-copySubData",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002069 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.b"
        "asic-drawArrays-singlePrimitive",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002070 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "basic-drawArrays-manyPrimitives",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002071 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.basic-drawArrays-instancing",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002072 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.basic-drawArrays-xfbPaused",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002073 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.ba"
        "sic-drawElements-singlePrimitive",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002074 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.b"
        "asic-drawElements-manyPrimitives",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002075 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-drawElements-instancing",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002076 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-drawElements-xfbPaused",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002077 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indir"
        "ect.basic-drawArrays-simple",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002078 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indire"
        "ct.basic-drawArrays-noFirst",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002079 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-drawArrays-bufferOffset",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002080 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.basic-drawArrays-vertexIds",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002081 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indire"
        "ct.basic-drawElements-simple",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002082 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "basic-drawElements-noFirstIndex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002083 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-drawElements-basevertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002084 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "basic-drawElements-bufferOffset",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002085 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-drawElements-vertexIds",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002086 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.bas"
        "ic-indicesDataType-unsigned_short",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002087 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.ba"
        "sic-indicesDataType-unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002088 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-mode-drawArrays-points",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002089 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.basic-mode-drawArrays-lines",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002090 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.b"
        "asic-mode-drawArrays-line_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002091 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "basic-mode-drawArrays-line_loop",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002092 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.bas"
        "ic-mode-drawArrays-triangle_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002093 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.ba"
        "sic-mode-drawArrays-triangle_fan",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002094 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.bas"
        "ic-mode-drawArrays-lines_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002095 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic-"
        "mode-drawArrays-line_strip_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002096 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic"
        "-mode-drawArrays-triangles_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002097 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic-mo"
        "de-drawArrays-triangle_strip_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002098 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "basic-mode-drawElements-points",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002099 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".basic-mode-drawElements-lines",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002100 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.ba"
        "sic-mode-drawElements-line_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002101 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.b"
        "asic-mode-drawElements-line_loop",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002102 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basi"
        "c-mode-drawElements-triangle_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002103 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.bas"
        "ic-mode-drawElements-triangle_fan",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002104 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basi"
        "c-mode-drawElements-lines_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002105 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic-m"
        "ode-drawElements-line_strip_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002106 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic-"
        "mode-drawElements-triangles_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002107 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.basic-mod"
        "e-drawElements-triangle_strip_adjacency",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002108 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.advan"
        "ced-twoPass-transformFeedback-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002109 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.advanc"
        "ed-twoPass-transformFeedback-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002110 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "advanced-twoPass-Compute-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002111 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.a"
        "dvanced-twoPass-Compute-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002112 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect.ad"
        "vanced-primitiveRestart-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002113 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.negative-noindirect-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002114 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-noindirect-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002115 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.negative-invalidMode-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002116 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-invalidMode-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002117 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.negative-noVAO-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002118 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indir"
        "ect.negative-noVAO-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002119 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indi"
        "rect.negative-noVBO-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002120 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indir"
        "ect.negative-noVBO-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002121 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-bufferMapped-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002122 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect."
        "negative-bufferMapped-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002123 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-invalidType-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002124 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.negative-wrongOffset-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002125 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-wrongOffset-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002126 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirec"
        "t.negative-invalidSize-arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002127 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indirect"
        ".negative-invalidSize-elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002128 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_indire"
        "ct.negative-unalignedOffset",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002129 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.draw_"
        "indirect.negative-xfb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002130 end";
}
