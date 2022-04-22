/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const BUNDLE_NAME = "com.ohos.callui"
const ABILITIY_NAME = "com.ohos.callui.MainAbility"

export default function getAbilityIcon() {
    describe('ActsBmsGetAbilityIconTest', function () {

        /*
         * @tc.number: bms_getAbilityIcon_0100
         * @tc.name: test getAbilityIcon`
         * @tc.desc: get the abilityIcon
         */
        it('bms_getAbilityIcon_0100', 0, async function (done) {
            bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME).then(pixelmap => {
                console.log('bms_getAbilityIcon_0100 success: ' + pixelmap);
                expect(pixelmap !== null).assertTrue();
                done();
            })
                .catch(err => {
                    console.info("getAbilityIcon fail:" + JSON.stringify(err))
                    expect(err).assertFail();
                    done();
                });
        });

        /*
         * @tc.number: bms_getAbilityIcon_0200
         * @tc.name: test getAbilityIcon
         * @tc.desc: get the abilityIcon
         */
        it('bms_getAbilityIcon_0200', 0, async function (done) {
            bundle.getAbilityIcon(BUNDLE_NAME, ABILITIY_NAME, (err, pixelmap) => {
                expect(err).assertEqual(0);
                expect(pixelmap !== null).assertTrue();
                done();
            });
        });
    });
}