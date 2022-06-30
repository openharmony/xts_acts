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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000048, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000048 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.pr"
        "imitive_counter.point_to_point",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000048 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000048 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000049, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000049 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primi"
        "tive_counter.points_to_line_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000049 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000049 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primiti"
        "ve_counter.points_to_triangle_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000050 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.pr"
        "imitive_counter.lines_to_points",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000051 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.prim"
        "itive_counter.lines_to_line_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000052 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primit"
        "ive_counter.lines_to_triangle_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000053 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.prim"
        "itive_counter.triangles_to_points",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000054 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primit"
        "ive_counter.triangles_to_line_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000055 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitiv"
        "e_counter.triangles_to_triangle_strip",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000056 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.prim"
        "itive_counter.points_to_points_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000057 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primit"
        "ive_counter.points_to_line_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000058 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitiv"
        "e_counter.points_to_triangle_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000059 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.prim"
        "itive_counter.lines_to_points_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000060 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primit"
        "ive_counter.lines_to_line_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000061 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitiv"
        "e_counter.lines_to_triangle_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000062 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primit"
        "ive_counter.triangles_to_points_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000063 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitiv"
        "e_counter.triangles_to_line_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000064 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitive_"
        "counter.triangles_to_triangle_strip_rp",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000065 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.geometry_shader.primitiv"
        "e_counter.primitive_id_from_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000066 end";
}
