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
#include "../ActsDeqpgles30035TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034981 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034982 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034983 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034984 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034985 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034986 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034987 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034988 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034989 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034990 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034991 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034992 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034993 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034994 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034995 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034996 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034997 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034998 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_034999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_034999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_034999 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035000 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035001 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035002 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035003 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035004 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035005 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035006 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035007 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035008 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035009 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035010 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035011 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035012 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035013 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035014 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_bas"
        "ic_array.packed.row_major_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035015 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035016 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.column_major_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035017 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035018 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035019 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035020 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_bas"
        "ic_array.packed.row_major_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035021 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035022 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.column_major_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035023 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035024 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.singl"
        "e_basic_array.packed.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035025 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035026 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035027, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035027 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_bas"
        "ic_array.packed.row_major_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035027 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035027 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035028, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035028 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035028 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035028 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035029, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035029 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.column_major_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035029 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035029 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035030, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035030 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035030 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035030 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035031, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035031 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035031 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035031 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035032, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035032 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035032 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035032 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035033, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035033 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035033 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035033 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035034, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035034 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035034 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035034 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035035, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035035 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035035 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035035 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035036, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035036 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035036 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035036 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035037, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035037 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035037 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035037 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035038, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035038 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035038 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035038 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035039, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035039 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035039 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035039 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035040, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035040 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035040 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035040 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035041, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035041 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035041 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035041 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035042, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035042 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035042 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035042 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035043, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035043 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035043 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035043 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035044, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035044 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035044 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035044 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035045, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035045 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035045 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035045 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035046, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035046 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035046 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035046 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035047, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035047 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035047 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035047 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035048, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035048 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035048 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035048 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035049, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035049 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035049 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035049 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035050 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035051 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035052 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035053 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035054 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035055 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035056 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035057 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035058 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035059 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035060 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single"
        "_basic_array.packed.mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035061 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_"
        "basic_array.packed.mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035062 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basi"
        "c_array.packed.row_major_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035063 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic"
        "_array.packed.row_major_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035064 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_"
        "array.packed.column_major_mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035065 end";
}

static HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_basic_a"
        "rray.packed.column_major_mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30035TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30035TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30035TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30035TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30035TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035066 end";
}
