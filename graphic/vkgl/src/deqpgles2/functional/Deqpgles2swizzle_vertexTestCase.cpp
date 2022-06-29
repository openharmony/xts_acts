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
#include "../ActsDeqpgles20009TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008932 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008933 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008934 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008935 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008936 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008937 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008938, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008938 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008938 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008938 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008939, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008939 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008939 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008939 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008940, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008940 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008940 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008940 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008941, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008941 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.random.swizzle.vertex.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008941 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008941 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008942, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008942 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008942 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008942 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008943, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008943 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008943 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008943 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008944, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008944 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008944 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008944 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008945, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008945 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008945 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008945 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008946, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008946 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008946 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008946 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008947, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008947 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008947 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008947 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008948, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008948 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008948 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008948 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008949, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008949 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008949 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008949 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008950, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008950 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008950 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008950 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008951 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008952 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008953 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008954 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008955, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008955 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008955 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008955 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008956 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008957 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008958 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008959 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008960 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008961 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008962 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008963 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008964 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008965 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008966 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008967 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008968 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008969 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008970 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008971 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008972 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008973 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008974 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008975 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008976 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008977 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008978 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008979 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008980 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.vertex.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008981 end";
}
