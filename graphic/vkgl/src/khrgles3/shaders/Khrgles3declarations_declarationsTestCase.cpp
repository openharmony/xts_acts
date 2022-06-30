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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.decla"
        "rations.missing_variable_name_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000001 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declar"
        "ations.missing_variable_name_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000002 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declar"
        "ations.comma_preceding_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000003 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declara"
        "tions.comma_preceding_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000004 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declar"
        "ations.comma_following_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000005 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declara"
        "tions.comma_following_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000006 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declarati"
        "ons.struct_missing_attribute_name_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000007 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declaratio"
        "ns.struct_missing_attribute_name_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000008 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declaratio"
        "ns.struct_comma_preceding_attribute_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000009 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.declarations.declaration"
        "s.struct_comma_preceding_attribute_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000010 end";
}
