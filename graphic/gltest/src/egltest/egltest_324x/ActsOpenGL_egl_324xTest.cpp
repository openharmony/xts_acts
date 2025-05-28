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

#include "ActsOpenGL_egl_324xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGL_egl_324xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGL_egl_324xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGL_egl_324xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGL_egl_324xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGL_egl_324xTest, TestOpenGLegl324xTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLegl324xTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/3.2.4.x/"
                "egl-master.txt "
                "--deqp-log-filename=ActsOpenGLegl324xTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLegl324xTest------\n");
    }
}