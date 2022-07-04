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
#include "../ActsDeqpgles20003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_"
        "subscript.vec2_direct_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002995 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_s"
        "ubscript.vec2_direct_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002996 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_s"
        "ubscript.vec2_direct_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002997 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_su"
        "bscript.vec2_direct_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002998 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc"
        "ript.vec2_direct_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002999 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_direct_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003000 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc"
        "ript.vec2_direct_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003001 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_direct_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003002 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_direct_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003003 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_direct_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003004 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_direct_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003005 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_direct_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003006 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_s"
        "ubscript.vec2_component_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003007 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_su"
        "bscript.vec2_component_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003008 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_sub"
        "script.vec2_component_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003009 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subs"
        "cript.vec2_component_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003010 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_component_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003011 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_component_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003012 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_component_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003013 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_component_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003014 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_component_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003015 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_component_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003016 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_component_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003017 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_component_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003018 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc"
        "ript.vec2_static_subscript_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003019 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_static_subscript_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003020 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_static_subscript_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003021 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_static_subscript_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003022 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_static_subscript_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003023 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v"
        "ec2_static_subscript_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003024 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_static_subscript_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003025 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v"
        "ec2_static_subscript_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003026 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003027, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003027 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve"
        "c2_static_subscript_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003027 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003027 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003028, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003028 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_static_subscript_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003028 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003028 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003029, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003029 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_static_subscript_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003029 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003029 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003030, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003030 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_static_subscript_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003030 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003030 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003031, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003031 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc"
        "ript.vec2_dynamic_subscript_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003031 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003031 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003032, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003032 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr"
        "ipt.vec2_dynamic_subscript_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003032 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003032 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003033, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003033 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_dynamic_subscript_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003033 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003033 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003034, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003034 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_dynamic_subscript_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003034 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003034 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003035, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003035 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_dynamic_subscript_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003035 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003035 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003036, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003036 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v"
        "ec2_dynamic_subscript_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003036 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003036 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003037, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003037 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v"
        "ec2_dynamic_subscript_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003037 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003037 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003038, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003038 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve"
        "c2_dynamic_subscript_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003038 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003038 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003039, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003039 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_dynamic_subscript_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003039 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003039 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003040, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003040 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_dynamic_subscript_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003040 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003040 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003041, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003041 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_dynamic_subscript_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003041 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003041 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003042, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003042 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003042 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003042 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003043, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003043 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri"
        "pt.vec2_static_loop_subscript_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003043 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003043 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003044, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003044 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_static_loop_subscript_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003044 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003044 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003045, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003045 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_static_loop_subscript_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003045 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003045 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003046, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003046 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_static_loop_subscript_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003046 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003046 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003047, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003047 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve"
        "c2_static_loop_subscript_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003047 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003047 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003048, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003048 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_static_loop_subscript_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003048 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003048 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003049, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003049 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_static_loop_subscript_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003049 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003049 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_static_loop_subscript_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003050 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_"
        "static_loop_subscript_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003051 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_s"
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003052 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_"
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003053 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_s"
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003054 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip"
        "t.vec2_dynamic_loop_subscript_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003055 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_dynamic_loop_subscript_write_direct_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003056 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript"
        ".vec2_dynamic_loop_subscript_write_component_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003057 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript."
        "vec2_dynamic_loop_subscript_write_component_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003058 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_dynamic_loop_subscript_write_static_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003059 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_dynamic_loop_subscript_write_static_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003060 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec"
        "2_dynamic_loop_subscript_write_dynamic_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003061 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2"
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003062 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_"
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003063 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_d"
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003064 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_d"
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003065 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_dy"
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003066 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vector_"
        "subscript.vec3_direct_write_direct_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003067 end";
}
