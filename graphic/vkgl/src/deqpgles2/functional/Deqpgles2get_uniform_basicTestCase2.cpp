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
#include "../ActsDeqpgles20015TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_value.get_uniform.basic.ivec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014791 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assi"
        "gned.by_value.get_uniform.basic.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014792 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assig"
        "ned.by_value.get_uniform.basic.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014793 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_value.get_uniform.basic.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014794 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bool_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014795 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bool_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014796 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.bool_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014797 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.bool_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014798 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bool_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014799 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assign"
        "ed.by_value.get_uniform.basic.bool_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014800 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec2_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014801 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.basic.bvec2_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014802 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec2_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014803 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec2_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014804 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec2_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014805 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.bvec2_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014806 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec3_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014807 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.basic.bvec3_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014808 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec3_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014809 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec3_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014810 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014811, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014811 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec3_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014811 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014811 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014812, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014812 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.bvec3_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014812 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014812 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014813, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014813 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec4_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014813 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014813 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014814, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014814 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.basic.bvec4_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014814 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014814 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014815, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014815 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec4_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014815 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014815 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.bvec4_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014816 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.basic.bvec4_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014817 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014818, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014818 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.bvec4_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014818 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014818 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014819, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014819 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assign"
        "ed.by_value.get_uniform.basic.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014819 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014819 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014820, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014820 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014820 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014820 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014821, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014821 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assig"
        "ned.by_value.get_uniform.basic.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014821 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014821 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014822, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014822 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.basic.samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014822 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014822 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.basic.samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014823 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assign"
        "ed.by_value.get_uniform.basic.samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014824 end";
}
