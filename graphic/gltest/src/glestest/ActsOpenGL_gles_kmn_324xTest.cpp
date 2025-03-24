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
#include <stdlib.h>
#include "ActsOpenGL_gles_kmn_324xTest.h"
#include "syscap_ndk.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskmn324xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskmn324xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskmn324xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskmn324xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskmn324xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn324xTest01------\n");
        if (canIUse("SystemCapability.Graphic.OpenGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.4.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn324xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn324xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn324xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn324xTest02------\n");
        if (canIUse("SystemCapability.Graphic.OpenGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.4.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn324xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn324xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn324xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn324xTest03------\n");
        if (canIUse("SystemCapability.Graphic.OpenGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.4.x/"
                "gles2-khr-noctx-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn324xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn324xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn324xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn324xTest04------\n");
        if (canIUse("SystemCapability.Graphic.OpenGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.4.x/"
                "gles32-khr-noctx-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn324xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn324xTest04------\n");
    }
}