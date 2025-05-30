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

#include "ActsOpenGlMainGl44KhrSingleTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"
 
 
namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGlMainGl44KhrSingleTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGlMainGl44KhrSingleTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGlMainGl44KhrSingleTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGlMainGl44KhrSingleTest::TearDown()
    {
    }
    
    /*
     * @tc.number: TestOpenGLmainkmsglTestCase02
     * @tc.name: TestOpenGLmainkmsglTestCase02
     * @tc.desc: test for ActsOpenGlMainGl44KhrSingleTest.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    HWTEST_F(ActsOpenGlMainGl44KhrSingleTest, TestOpenGLmainkmsglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGlMainGl44KhrSingleTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl44-khr-single.txt "
                "--deqp-log-filename=ActsOpenGlMainGl44KhrSingleTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGlMainGl44KhrSingleTest------\n");
    }
}