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
#include "../ActsKhrgles310002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.simple-compute",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001964 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.one-work-group",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001965 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.resource-ubo",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001966 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.resource-texture",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001967 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.resource-image",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001968 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sha"
        "der.resource-atomic-counter",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001969 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.resource-uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001970 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_"
        "shader.built-in-variables",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001971 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.c"
        "ompute_shader.max",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001972 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.work-group-size",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001973 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.build-separable",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001974 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.shared-simple",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001975 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.shared-struct",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001976 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_"
        "shader.dispatch-indirect",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001977 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_s"
        "hader.sso-compute-pipeline",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001978 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comp"
        "ute_shader.sso-case2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001979 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comp"
        "ute_shader.sso-case3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001980 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.atomic-case1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001981 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.atomic-case2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001982 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.atomic-case3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001983 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comp"
        "ute_shader.copy-image",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001984 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.pipeline-pre-vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001985 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_shad"
        "er.pipeline-gen-draw-commands",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001986 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sh"
        "ader.pipeline-compute-chain",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001987 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.pipeline-post-fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001988 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_"
        "shader.pipeline-post-xfb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001989 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute"
        "_shader.shared-indexing",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001990 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comp"
        "ute_shader.shared-max",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001991 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.comput"
        "e_shader.resources-max",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001992 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sh"
        "ader.work-group-size-usage",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001993 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sh"
        "ader.api-no-active-program",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001994 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_s"
        "hader.api-work-group-count",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001995 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.api-indirect",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001996 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compu"
        "te_shader.api-program",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001997 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sha"
        "der.glsl-compile-time-errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001998 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_sh"
        "ader.glsl-link-time-errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001999 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_002000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.compute_"
        "shader.api-attach-shader",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002000 end";
}
