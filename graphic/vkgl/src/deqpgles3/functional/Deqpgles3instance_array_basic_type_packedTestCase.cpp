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
#include "../ActsDeqpgles30036TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035613 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035614 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035615 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035616 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035617 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035618 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035619 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035620 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance"
        "_array_basic_type.packed.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035621 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035622 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035623 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035624 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035625 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035626 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035627 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035628 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035629 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035630 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035631 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035632 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035633 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035634 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035635 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035636 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035637 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035638 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035639 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035640 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035641 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035642 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035643 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035644 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035645 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035646 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array"
        "_basic_type.packed.row_major_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035647 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035648 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.column_major_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035649 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035650 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035651 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035652 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array"
        "_basic_type.packed.row_major_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035653 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035654 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.column_major_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035655 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035656 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_"
        "array_basic_type.packed.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035657 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035658 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array"
        "_basic_type.packed.row_major_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035659 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035660 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.column_major_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035661 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035662 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035663 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035664 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035665 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035666 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035667 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035668 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035669 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035670 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035671 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035672 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035673 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035674 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035675 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035676 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035677 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035678 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035679 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035680 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035681 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035682 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035683 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035684 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035685 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035686 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035687 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035688 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035689 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035690 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035691 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035692 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_a"
        "rray_basic_type.packed.mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035693 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_ar"
        "ray_basic_type.packed.mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035694 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_"
        "basic_type.packed.row_major_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035695 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.row_major_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035696 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_b"
        "asic_type.packed.column_major_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035697 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.instance_array_ba"
        "sic_type.packed.column_major_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035698 end";
}
