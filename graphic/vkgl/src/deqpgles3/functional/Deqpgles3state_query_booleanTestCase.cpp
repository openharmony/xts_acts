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
#include "../ActsDeqpgles30043TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolea"
        "n.primitive_restart_fixed_index_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042358 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean"
        ".primitive_restart_fixed_index_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042359 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean"
        ".primitive_restart_fixed_index_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042360 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean."
        "primitive_restart_fixed_index_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042361 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolea"
        "n.primitive_restart_fixed_index_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042362 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.rasterizer_discard_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042363 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.rasterizer_discard_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042364 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.rasterizer_discard_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042365 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bo"
        "olean.rasterizer_discard_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042366 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.rasterizer_discard_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042367 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.boolean.cull_face_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042368 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.cull_face_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042369 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.cull_face_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042370 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.cull_face_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042371 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.boolean.cull_face_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042372 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.polygon_offset_fill_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042373 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bo"
        "olean.polygon_offset_fill_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042374 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bo"
        "olean.polygon_offset_fill_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042375 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boo"
        "lean.polygon_offset_fill_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042376 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.polygon_offset_fill_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042377 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bool"
        "ean.sample_alpha_to_coverage_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042378 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bool"
        "ean.sample_alpha_to_coverage_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042379 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bool"
        "ean.sample_alpha_to_coverage_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042380 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boole"
        "an.sample_alpha_to_coverage_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042381 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boo"
        "lean.sample_alpha_to_coverage_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042382 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.sample_coverage_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042383 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.sample_coverage_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042384 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.sample_coverage_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042385 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.sample_coverage_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042386 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.sample_coverage_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042387 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.scissor_test_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042388 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.scissor_test_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042389 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.scissor_test_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042390 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.scissor_test_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042391 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.scissor_test_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042392 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.stencil_test_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042393 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.stencil_test_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042394 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.stencil_test_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042395 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.stencil_test_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042396 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.stencil_test_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042397 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.depth_test_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042398 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.depth_test_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042399 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.boolean.depth_test_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042400 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.boolean.depth_test_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042401 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.boolean.depth_test_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042402 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_"
        "query.boolean.blend_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042403 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.boolean.blend_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042404 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.boolean.blend_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042405 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.boolean.blend_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042406 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_"
        "query.boolean.blend_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042407 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.boolean.dither_isenabled",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042408 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.boolean.dither_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042409 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.boolean.dither_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042410 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.boolean.dither_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042411 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_"
        "query.boolean.dither_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042412 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.color_writemask_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042413 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.color_writemask_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042414 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.color_writemask_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042415 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.color_writemask_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042416 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.depth_writemask_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042417 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.depth_writemask_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042418 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.depth_writemask_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042419 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.depth_writemask_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042420 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boo"
        "lean.sample_coverage_invert_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042421 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boo"
        "lean.sample_coverage_invert_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042422 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bool"
        "ean.sample_coverage_invert_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042423 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bo"
        "olean.sample_coverage_invert_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042424 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.shader_compiler_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042425 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.shader_compiler_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042426 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.shader_compiler_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042427 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".boolean.shader_compiler_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042428 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_active_initial_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042429 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_active_initial_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042430 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.tr"
        "ansform_feedback_active_initial_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042431 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean."
        "transform_feedback_active_initial_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042432 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_paused_initial_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042433 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_paused_initial_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042434 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.tr"
        "ansform_feedback_paused_initial_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042435 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean."
        "transform_feedback_paused_initial_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042436 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.transform_feedback_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042437 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.b"
        "oolean.transform_feedback_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042438 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.bo"
        "olean.transform_feedback_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042439 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "boolean.transform_feedback_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042440 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_implicit_resume_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042441 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.t"
        "ransform_feedback_implicit_resume_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042442 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean.tr"
        "ansform_feedback_implicit_resume_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042443 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.boolean."
        "transform_feedback_implicit_resume_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042444 end";
}
