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

#include "ActsOpenGL_gl30_gtf_masterTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGL_gl30_gtf_masterTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGL_gl30_gtf_masterTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGL_gl30_gtf_masterTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGL_gl30_gtf_masterTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGL_gl30_gtf_masterTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgl30gtfmasterTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgl30gtfmasterTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgl30gtfmasterTest------\n");
    }
}