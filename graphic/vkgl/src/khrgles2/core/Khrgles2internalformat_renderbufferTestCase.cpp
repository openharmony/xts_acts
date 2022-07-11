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
#include <climits>
#include <gtest/gtest.h>
#include "../Khrgles2BaseFunc.hpp"
#include "../ActsKhrgles20001TestSuite.hpp"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgba8 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgba8 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgba8 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb8 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb8 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb8 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index1_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.stencil_index1_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index1_oes Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index1_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index4_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.stencil_index4_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index4_oes Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index4_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index8 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index8 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.stencil_index8 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component16 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component16 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component16 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component24 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component24 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component24 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component32 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.depth_component32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component32 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth_component32 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth24_stencil8 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth24_stencil8 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.depth24_stencil8 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb5_a1 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.renderbuffer.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb5_a1 Unavaliable!";
    } else if (result.isComplete == true) {
        EXPECT_TRUE(result.isComplete == true);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.renderbuffer.rgb5_a1 end";
}
