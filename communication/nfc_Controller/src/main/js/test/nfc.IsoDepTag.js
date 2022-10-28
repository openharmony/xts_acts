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

let NdefRecord = {
    NFC_A : 1,
    NFC_B : 2,
    ISO_DEP	 : 3,
    NFC_F : 4,
    NFC_V : 5,
    NDEF : 6,
    MIFARE_CLASSIC : 8,
    MIFARE_ULTRALIGHT : 9,
    NDEF_FORMATABLE : 10,
};

let NfcForumType = {
    NFC_FORUM_TYPE_1 : 1,
    NFC_FORUM_TYPE_2 : 2,
    NFC_FORUM_TYPE_3 : 3,
    NFC_FORUM_TYPE_4 : 4,
    MIFARE_CLASSIC : 101,
};

let isoDepTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 3],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "HistoricalBytes": "4D54000500308693695B", "HiLayerResponse": "",
        },
    ],
    "tagRfDiscId": 1,
};
let isoDep ;
export default function nfcIsoDepTagTest() {
    describe('nfcIsoDepTagTest', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
            try{
                isoDep = tag.getIsoDep(isoDepTaginfo);
            }catch(error){
                console.info('getIsoDep is ->' + error)
            }
        })
        beforeEach(function() {
            console.info('[NFC_test]beforeEach called')
        })
        afterEach(function () {
            console.info('[NFC_test]afterEach called')
        })
        afterAll(function () {
            console.info('[NFC_test]afterAll called')
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0010
         * @tc.name Test getHistoricalBytes IsoDep
         * @tc.desc Obtains the history bytes of a label.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0100', 0, function ()  { 
            let ResponseFlags = isoDep.getHistoricalBytes(); 
            expect(ResponseFlags).assertInstanceOf('Array')
            console.info('[nfc_js] test ResponseFlags data>:' + ResponseFlags);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0010
         * @tc.name Test getHiLayerResponse IsoDep
         * @tc.desc HiLayer response byte for obtaining the tag.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0200', 0, function ()  {
            let HiLayerResponse = isoDep.getHiLayerResponse(); 
            expect(HiLayerResponse).assertInstanceOf('Array')
            console.info('[nfc_js] test ResponseFlags data>:' + HiLayerResponse);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0010
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0300', 0, async function (done) {
            await isoDep.isExtendedApduSupported().then((data) => {
                expect(false).assertEqual(data);
                console.info("isoDep isExtendedApduSupported data: " + data);
                done();
            }).catch((err)=> {
                console.info("isoDep isExtendedApduSupported err: " + err);
                expect().assertFail();
                done();
            });
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0010
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0400', 0, async function (done) {
            isoDep.isExtendedApduSupported((err, data)=> {
                if (err) {
                    expect().assertFail();
                    console.info("isoDep isExtendedApduSupported err: " + err);
                } else {
                    expect(false).assertEqual(data);
                    console.info("isoDep isExtendedApduSupported data: " + data);
                }
            });
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}

