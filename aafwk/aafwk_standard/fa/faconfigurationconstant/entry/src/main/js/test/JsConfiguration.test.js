/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import ConfigurationConstant from '@ohos.application.ConfigurationConstant'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('ConfigurationTest', function () {

    /*
     * @tc.number  SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0100
     * @tc.name    colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT"
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0100', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0100-------------");
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT).assertEqual(1);
        done();
        console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0100-------------");
    });

    /*
     * @tc.number  SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0200
     * @tc.name    colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_DARK"
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0200', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0200-------------");
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_DARK).assertEqual(0);
        done();
        console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0200-------------");
    });

    /*
     * @tc.number  SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0300
     * @tc.name    colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET"
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0300', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0300-------------");
        expect(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertEqual(-1);
        done();
        console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_0300-------------");
    });
})