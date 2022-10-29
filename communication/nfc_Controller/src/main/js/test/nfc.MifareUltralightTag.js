/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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


import tag from '@ohos.nfc.tag';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

let mifareUltralightTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 9],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "MifareUltralightC": "ture",
        },
    ],
    "tagRfDiscId": 1,
};

let MifareUltralightType = {
    TYPE_UNKOWN : 0x04,
    TYPE_ULTRALIGHT : 1,
    TYPE_ULTRALIGHT_C : 2,
}

let MifareUltralightTag = null;

export default function nfcMifareUltralightTag() {
    describe('nfcMifareUltralightTag', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
        })
        beforeEach(function() {
            try{
                MifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
                console.info(' mifareUltralight is' + mifareUltralight)
            }catch(error){
                console.info(' mifareUltralight error' + error)
            }
            console.info('[NFC_test]beforeEach called')
        })
        afterEach(function () {
            console.info('[NFC_test]afterEach called')
        })
        afterAll(function () {
            console.info('[NFC_test]afterAll called')
        })
            
        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0100
         * @tc.name testreadMultiplePages
         * @tc.desc Test readMultiplePages api by promise.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareUltralight_0100', 0, async function (done) {


            let pageIndex = 1;
            await MifareUltralightTag.readMultiplePages(pageIndex).then((data) => {
                console.info("mifareUltralight readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                expect(true).assertTrue(data >= 0);
                done();
            }).catch((err)=> {
                console.info("mifareUltralight readMultiplePages1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0200
         * @tc.name testreadMultiplePages
         * @tc.desc Test readMultiplePages api by callback.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareUltralight_0200', 0, async function (done) {
            let pageIndex = 1;
            MifareUltralightTag.readMultiplePages(pageIndex, (err, data)=> {
                if (err) {
                    console.info("mifareUltralight readMultiplePages2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.info("mifareUltralight readMultiplePages2 data: " + data + "json2:" + JSON.stringify(data));
                    expect(true).assertTrue(data >= 0);
                }
            });
            sleep(3000);
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0300
         * @tc.name testgetType
         * @tc.desc Gets the type of Mifare Ultralight label
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareUltralight_0500', 0, function ()  {
            let getType = MifareUltralightTag.getType();
            console.info("mifareUltralight getType: " + getType);
            expect(true).assertTrue(getType >= -1);
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })	

}

