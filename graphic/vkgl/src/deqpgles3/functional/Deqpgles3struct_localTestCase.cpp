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
#include "../ActsDeqpgles30017TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.struct.local.basic_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016448 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.struct.local.basic_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016449 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.struct.local.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016450 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".struct.local.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016451 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.s"
        "truct.local.array_member_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016452 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.array_member_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016453 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.l"
        "ocal.array_member_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016454 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.lo"
        "cal.array_member_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016455 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.s"
        "truct.local.struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016456 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016457 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.l"
        "ocal.struct_array_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016458 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.lo"
        "cal.struct_array_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016459 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016460 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016461 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.loca"
        "l.nested_struct_array_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016462 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.local"
        ".nested_struct_array_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016463 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".struct.local.parameter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016464 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders."
        "struct.local.parameter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016465 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.parameter_inout_lowp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016466 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.parameter_inout_lowp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016467 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.parameter_inout_mediump_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016468 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.parameter_inout_mediump_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016469 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.parameter_inout_highp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016470 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.parameter_inout_highp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016471 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.str"
        "uct.local.parameter_nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016472 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.parameter_nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016473 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.parameter_out_lowp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016474 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.parameter_out_lowp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016475 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.parameter_out_mediump_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016476 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.parameter_out_mediump_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016477 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.parameter_out_highp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016478 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.parameter_out_highp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016479 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.struct.local.return_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016480 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders"
        ".struct.local.return_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016481 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.s"
        "truct.local.return_nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016482 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.return_nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016483 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.conditional_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016484 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.conditional_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016485 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.loop_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016486 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.str"
        "uct.local.loop_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016487 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.dynamic_loop_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016488 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.dynamic_loop_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016489 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.lo"
        "cal.nested_conditional_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016490 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.loc"
        "al.nested_conditional_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016491 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.nested_loop_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016492 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.nested_loop_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016493 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.loc"
        "al.nested_dynamic_loop_assignment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016494 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.loca"
        "l.nested_dynamic_loop_assignment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016495 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.str"
        "uct.local.loop_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016496 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.loop_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016497 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.loop_nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016498 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.l"
        "ocal.loop_nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016499 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct."
        "local.dynamic_loop_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016500 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.l"
        "ocal.dynamic_loop_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016501 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.loca"
        "l.dynamic_loop_nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016502 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct.local"
        ".dynamic_loop_nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016503 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders."
        "struct.local.basic_equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016504 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.s"
        "truct.local.basic_equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016505 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.basic_not_equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016506 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.str"
        "uct.local.basic_not_equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016507 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.s"
        "truct.local.nested_equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016508 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.st"
        "ruct.local.nested_equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016509 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.str"
        "uct.local.nested_not_equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016510 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.stru"
        "ct.local.nested_not_equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016511 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struc"
        "t.local.array_member_equality_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016512 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.struct"
        ".local.array_member_equality_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016513 end";
}
