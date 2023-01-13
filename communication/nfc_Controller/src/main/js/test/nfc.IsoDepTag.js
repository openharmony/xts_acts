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
import cardEmulation from '@ohos.nfc.cardEmulation';

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

let FeatureType = {
    HCE : 0,
    UICC : 0,
    ESE : 0,
}

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

let CardType = {
    PAYMENT : "payment",
    OTHER : "other",
};

let IsoDepTag ;

export default function nfcIsoDepTagTest() {
    describe('nfcIsoDepTagTest', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
            try {
                IsoDepTag = tag.getIsoDep(isoDepTaginfo);
            } catch (error) {
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
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0100
         * @tc.name Test getHistoricalBytes IsoDep
         * @tc.desc Obtains the history bytes of a label.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0100', 0, function ()  { 
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let ResponseFlags = IsoDepTag.getHistoricalBytes(); 
                expect(ResponseFlags).assertInstanceOf('Array')
                console.info('[nfc_js] test ResponseFlags data>:' + ResponseFlags);
            } else {
                console.info("[NFC_test]IsoDepTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0200
         * @tc.name Test getHiLayerResponse IsoDep
         * @tc.desc HiLayer response byte for obtaining the tag.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0200', 0, function ()  {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let HiLayerResponse = IsoDepTag.getHiLayerResponse(); 
                expect(HiLayerResponse).assertInstanceOf('Array')
                console.info('[nfc_js] test ResponseFlags data2>:' + HiLayerResponse);
            } else {
                console.info("[NFC_test]IsoDepTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0300
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0300', 0, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                await IsoDepTag.isExtendedApduSupported().then((data) => {
                    expect(false).assertEqual(data);
                    console.info("isoDep isExtendedApduSupported data: " + data);
                    done();
                }).catch((err)=> {
                    console.info("isoDep isExtendedApduSupported err: " + err);
                    expect(true).assertFalse();
                    done();
                });
            } else {
                console.info("[NFC_test]IsoDepTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0400
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0400', 0, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                IsoDepTag.isExtendedApduSupported((err, data)=> {
                    if (err) {
                        expect(true).assertFalse();
                        console.info("isoDep isExtendedApduSupported err: " + err);
                    } else {
                        expect(false).assertEqual(data);
                        console.info("isoDep isExtendedApduSupported data: " + data);
                    }
                });
                done();
            } else {
                console.info("[NFC_test]IsoDepTag4 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0500
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card emulation.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfccardEmulationnfc_js_0500', 0, function ()  {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let cardEmulationnfc ;
                try {
                    cardEmulationnfc = cardEmulation.isSupported(FeatureType.ESE);
                    console.info('cardEmulationnfc type ->' + cardEmulationnfc )
                    expect(cardEmulationnfc).assertFalse();
                } catch (error) {
                    console.info('cardEmulationnfc error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]IsoDepTag5 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

       /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0600
         * @tc.name Test cardEmulationnfc
         * @tc.desc hasHceCapability to support a certain type of card emulation.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_0600', 0, function ()  {
            let cardEmulationnfc ;
            try {
                cardEmulationnfc = cardEmulation.hasHceCapability();
                console.info('cardEmulationnfc hasHceCapability type ->' + cardEmulationnfc )
                expect(cardEmulationnfc).assertFalse();
            } catch (error) {
                console.info('cardEmulationnfc error' + error)
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0700
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card isDefaultService.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_0700', 0, function ()  {
            let cardEmulationnfc ;
            let elementName = {
                "bundleName": "com.test.cardemulation",
                "abilityName": "com.test.cardemulation.MainAbility",
            };
            try {
                cardEmulationnfc = cardEmulation.isDefaultService(elementName, CardType.PAYMENT);
                console.info('cardEmulationnfc isDefaultService type ->' + cardEmulationnfc )
                expect(cardEmulationnfc).assertFalse();
            } catch (error) {
                console.info('cardEmulationnfc error' + error)
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


