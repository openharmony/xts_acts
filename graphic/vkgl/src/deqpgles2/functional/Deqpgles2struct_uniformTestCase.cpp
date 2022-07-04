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
#include "../ActsDeqpgles20008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.struct.uniform.basic_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007746 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".struct.uniform.basic_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007747 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".struct.uniform.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007748 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "struct.uniform.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007749 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.st"
        "ruct.uniform.array_member_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007750 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.str"
        "uct.uniform.array_member_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007751 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.un"
        "iform.array_member_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007752 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.uni"
        "form.array_member_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007753 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.st"
        "ruct.uniform.struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007754 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.str"
        "uct.uniform.struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007755 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.un"
        "iform.struct_array_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007756 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.uni"
        "form.struct_array_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007757 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struc"
        "t.uniform.nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007758 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct"
        ".uniform.nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007759 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.unifo"
        "rm.nested_struct_array_dynamic_index_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007760 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.unifor"
        "m.nested_struct_array_dynamic_index_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007761 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.stru"
        "ct.uniform.loop_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007762 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struc"
        "t.uniform.loop_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007763 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.u"
        "niform.loop_nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007764 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.un"
        "iform.loop_nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007765 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.u"
        "niform.dynamic_loop_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007766 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.un"
        "iform.dynamic_loop_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007767 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.unifo"
        "rm.dynamic_loop_nested_struct_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007768 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.unifor"
        "m.dynamic_loop_nested_struct_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007769 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".struct.uniform.sampler_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007770 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "struct.uniform.sampler_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007771 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.str"
        "uct.uniform.sampler_nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007772 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.stru"
        "ct.uniform.sampler_nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007773 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.st"
        "ruct.uniform.sampler_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007774 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.str"
        "uct.uniform.sampler_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007775 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct."
        "uniform.sampler_in_function_arg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007776 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.u"
        "niform.sampler_in_function_arg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007777 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.uni"
        "form.sampler_in_array_function_arg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007778 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.struct.unif"
        "orm.sampler_in_array_function_arg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007779 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.struct.uniform.equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007780 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".struct.uniform.equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007781 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "struct.uniform.not_equal_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007782 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.s"
        "truct.uniform.not_equal_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007783 end";
}
