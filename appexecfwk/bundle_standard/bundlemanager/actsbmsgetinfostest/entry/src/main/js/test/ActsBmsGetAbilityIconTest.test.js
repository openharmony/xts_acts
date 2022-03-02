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
import { describe, it, expect } from 'deccjsunit/index'

const NAMECOUNT = 10000
const bundleName = "com.ix.verify.io"
const abilityName = "com.example.SimulateFeatureAbilityFir"

describe('ActsBmsGetAbilityIconTest', function () {

    /*
     * @tc.number: bms_getAbilityIcon_0100
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
    it('bms_getAbilityIcon_0100', 0, async function (done) {
        bundle.getAbilityIcon(bundleName, abilityName).then(pixelmap => {
            console.log('bms_getAbilityIcon_0100 success: ' + pixelmap);
            expect(pixelmap !== null).assertTrue()
            expect(pixelmap.has("sampleSize")).assertTrue()
            done()
        })
        .catch(err => {
            console.info("getAbilityIcon fail:" + JSON.stringify(err))
            expect(err).assertFail()
            done()
        })
    })

    /*
     * @tc.number: bms_getAbilityIcon_0200
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
    it('bms_getAbilityIcon_0200', 0, async function (done) {
        let pixelmap = await bundle.getAbilityIcon(bundleName, abilityName)
        console.log('bms_getAbilityIcon_0200 success: ' + pixelmap);
        expect(pixelmap !== null).assertTrue()
        expect(pixelmap.has("sampleSize")).assertTrue()
        done()
    })

    /*
     * @tc.number: bms_getAbilityIcon_0100
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
    it('bms_getAbilityIcon_0100', 0, async function (done) {
        bundle.getAbilityIcon(bundleName, abilityName).then(pixelmap => {
            console.log('bms_getAbilityIcon_0100 success: ' + pixelmap);
            expect(pixelmap !== null).assertTrue()
            expect(pixelmap.has("desiredSize")).assertTrue()
            done()
        })
        .catch(err => {
            console.info("getAbilityIcon fail:" + JSON.stringify(err))
            expect(err).assertFail()
            done()
        })
    })

    /*
     * @tc.number: bms_getAbilityIcon_0400
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
    it('bms_getAbilityIcon_0400', 0, async function (done) {
        let pixelmap = await bundle.getAbilityIcon(bundleName, abilityName)
        console.log('bms_getAbilityIcon_0400 success: ' + pixelmap);
        expect(pixelmap !== null).assertTrue()
        expect(pixelmap.has("desiredSize")).assertTrue()
        done()
    })

    /*
     * @tc.number: bms_getAbilityIcon_0500
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
        it('bms_getAbilityIcon_0500', 0, async function (done) {
            let pixelmap = await bundle.getAbilityIcon(bundleName, abilityName)
            console.log('bms_getAbilityIcon_0500 success: ' + pixelmap);
            expect(pixelmap !== null).assertTrue()
            expect(pixelmap.has("desiredSize")).assertTrue()
            done()
        })

    /*
     * @tc.number: bms_getAbilityIcon_0600
     * @tc.name: test getAbilityIcon
     * @tc.desc: get the abilityIcon
     */
    it('bms_getAbilityIcon_0600', 0, async function (done) {
        let pixelmap = await bundle.getAbilityIcon(bundleName, abilityName)
        console.log('bms_getAbilityIcon_0600 success: ' + pixelmap);
        expect(pixelmap !== null).assertTrue()
        expect(pixelmap.has("desiredSize")).assertTrue()
        done()
    })
})
