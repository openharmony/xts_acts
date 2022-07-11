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
#include "../ActsKhrgles30004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003922, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003922 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversi"
        "ons.forbidden.texture2d_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003922 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003922 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003923, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003923 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003923 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003923 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003924, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003924 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003924 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003924 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003925, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003925 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003925 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003925 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003926, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003926 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003926 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003926 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003927 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture2d_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003928 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_negx_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003929 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003930 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003931 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003932 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003933 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003934 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negx_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003935 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_negy_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003936 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003937 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003938, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003938 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003938 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003938 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003939, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003939 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003939 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003939 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003940, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003940 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003940 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003940 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003941, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003941 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003941 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003941 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003942, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003942 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negy_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003942 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003942 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003943, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003943 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_negz_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003943 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003943 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003944, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003944 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003944 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003944 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003945, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003945 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003945 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003945 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003946, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003946 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003946 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003946 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003947, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003947 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003947 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003947 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003948, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003948 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003948 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003948 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003949, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003949 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_negz_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003949 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003949 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003950, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003950 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_posx_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003950 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003950 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003951 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003952 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003953 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003954 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003955, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003955 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003955 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003955 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posx_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003956 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_posy_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003957 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003958 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003959 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003960 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003961 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003962 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posy_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003963 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.cubemap_posz_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003964 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003965 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003966 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003967 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003968 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003969 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.cubemap_posz_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003970 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversion"
        "s.forbidden.texture_array_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003971 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003972 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003973 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003974 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003975 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003976 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.texture_array_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003977 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversi"
        "ons.forbidden.texture3d_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003978 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003979 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003980 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003981 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003982 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003983 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.texture3d_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003984 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversio"
        "ns.forbidden.renderbuffer_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003985 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_negx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003986 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_negy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003987 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_negz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003988 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_posx",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003989 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_posy",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003990 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.copy_tex_image_conversions"
        ".forbidden.renderbuffer_cubemap_posz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003991 end";
}
