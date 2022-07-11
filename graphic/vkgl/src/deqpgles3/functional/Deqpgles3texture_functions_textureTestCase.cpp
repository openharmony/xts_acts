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
#include "../ActsDeqpgles30017TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.sampler2d_fixed_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016825 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.sampler2d_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016826 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.sampler2d_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016827 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.sampler2d_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016828 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.textur"
        "e_functions.texture.isampler2d_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016829 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016830, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016830 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.isampler2d_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016830 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016830 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016831, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016831 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.textur"
        "e_functions.texture.usampler2d_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016831 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016831 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016832, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016832 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.usampler2d_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016832 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016832 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016833, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016833 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2d_bias_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016833 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016833 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016834, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016834 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2d_bias_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016834 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016834 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016835, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016835 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.isampler2d_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016835 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016835 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016836, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016836 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.usampler2d_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016836 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016836 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016837, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016837 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.samplercube_fixed_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016837 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016837 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016838, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016838 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.samplercube_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016838 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016838 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016839, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016839 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.samplercube_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016839 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016839 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016840, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016840 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.samplercube_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016840 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016840 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016841, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016841 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.isamplercube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016841 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016841 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016842, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016842 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_"
        "functions.texture.isamplercube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016842 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016842 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016843, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016843 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.usamplercube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016843 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016843 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016844, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016844 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_"
        "functions.texture.usamplercube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016844 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016844 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016845, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016845 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_funct"
        "ions.texture.samplercube_bias_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016845 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016845 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016846, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016846 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_funct"
        "ions.texture.samplercube_bias_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016846 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016846 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016847, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016847 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.isamplercube_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016847 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016847 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016848, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016848 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.usamplercube_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016848 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016848 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016849, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016849 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.sampler2darray_fixed_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016849 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016849 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016850, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016850 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2darray_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016850 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016850 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016851, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016851 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.sampler2darray_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016851 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016851 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016852, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016852 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2darray_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016852 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016852 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016853, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016853 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.isampler2darray_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016853 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016853 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016854, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016854 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.isampler2darray_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016854 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016854 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016855, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016855 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.usampler2darray_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016855 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016855 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016856, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016856 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.usampler2darray_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016856 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016856 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016857, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016857 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_functio"
        "ns.texture.sampler2darray_bias_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016857 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016857 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016858, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016858 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_functio"
        "ns.texture.sampler2darray_bias_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016858 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016858 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016859, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016859 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.isampler2darray_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016859 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016859 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016860, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016860 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.usampler2darray_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016860 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016860 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016861, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016861 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.sampler3d_fixed_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016861 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016861 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.sampler3d_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016862 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.sampler3d_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016863 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.sampler3d_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016864 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.textur"
        "e_functions.texture.isampler3d_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016865 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.isampler3d_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016866 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.textur"
        "e_functions.texture.usampler3d_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016867 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture"
        "_functions.texture.usampler3d_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016868 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler3d_bias_fixed_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016869 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler3d_bias_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016870 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.isampler3d_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016871 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.usampler3d_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016872 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_f"
        "unctions.texture.sampler2dshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016873 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.sampler2dshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016874 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2dshadow_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016875 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fu"
        "nctions.texture.samplercubeshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016876 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_fun"
        "ctions.texture.samplercubeshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016877 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_funct"
        "ions.texture.samplercubeshadow_bias_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016878 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.texture_func"
        "tions.texture.sampler2darrayshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016879 end";
}
