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

let aTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
    "supportedProfiles": 1,
};

let bTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [2],
    "extrasData": [
        {
            "AppData": "A0C0", "ProtocolInfo": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let fTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [4],
    "extrasData": [
        {
            "SystemCode": "A0C0", "Pmm": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let vTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [ 5 ],
    "extrasData": [
        {
            "ResponseFlags": 0x09, "DsfId": 0x13,
        }
    ],
    "tagRfDiscId": 1,
};

let Want = {
    "uid" : '01020304',
    "technology" : [1],
    "tagRfDiscId" :1,
    "Sak": 0x08, 
    "Atqa": "B000",
}

export default function nfcTagABFVTest() {
    describe('nfcTagABFVTest', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0100
         * @tc.name Test getNfcATag
         * @tc.desc This interface is used to obtain the NFC A tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0100', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                expect(NfcATag != null).assertTrue();
                expect(NfcATag instanceof Object).assertTrue();
                console.info('aTag is--<-!!!->' + JSON.stringify(NfcATag));
            } else {
                console.info("[NFC_test]NfcATag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0200
         * @tc.name Test getNfcBTag
         * @tc.desc This interface is used to obtain the NFC B tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0200', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                expect(NfcBTag != null).assertTrue();
                expect(NfcBTag instanceof Object).assertTrue();
                console.info('bTag is--<-!!!->' + JSON.stringify(NfcBTag));
            } else {
                console.info("[NFC_test]NfcBTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0300
         * @tc.name Test getNfcFTag
         * @tc.desc This interface is used to obtain the NFC F tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0300', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                expect(NfcFTag != null).assertTrue();
                expect(NfcFTag instanceof Object).assertTrue();
                console.info('fTag is--<-!!!->' + JSON.stringify(NfcFTag));
            } else {
                console.info("[NFC_test]NfcFTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0400
         * @tc.name Test getNfcVTag
         * @tc.desc This interface is used to obtain the NFC V tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0400', 0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                expect(NfcVTag != null).assertTrue();
                expect(NfcVTag instanceof Object).assertTrue();
                console.info('vTag is--<-!!!->' + JSON.stringify(NfcVTag));
            } else {
                console.info("[NFC_test]NfcVTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0500
         * @tc.name Test getsak_taga
         * @tc.desc Obtains the SAK value of the NFC-A tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0500', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let sak = NfcATag.getSak(); 
                expect(sak).assertInstanceOf('Number');
                console.info('[nfc_js] test sak data>:' + sak);
            } else {
                console.info("[NFC_test]NfcATag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0600
         * @tc.name Test getAtqa_taga
         * @tc.desc Obtains the Atqa value of the NFC-A tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0600', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let Atqa = NfcATag.getAtqa(); 
                expect(Atqa).assertInstanceOf('Array');
                console.info('[nfc_js] test Atqa data>:' + Atqa);
            } else {
                console.info("[NFC_test]NfcATag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0700
         * @tc.name Test getAppData_tagB
         * @tc.desc Obtains the AppData value of the NFC-B tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0700', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let AppData = NfcBTag.getRespAppData(); 
                expect(AppData).assertInstanceOf('Array');
                console.info('[nfc_js] test AppData data>:' + AppData);
            } else {
                console.info("[NFC_test]NfcBTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0800
         * @tc.name Test getRespProtocol_tagB
         * @tc.desc Obtains the Protocol value of the NFC-B tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_0800', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let Protocol = NfcBTag.getRespProtocol(); 
                expect(Protocol).assertInstanceOf('Array');
                console.info('[nfc_js] test Protocol data>:' + Protocol);
            } else {
                console.info("[NFC_test]NfcBTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0900
         * @tc.name Test getSystemCode_tagF
         * @tc.desc Obtains the SystemCode value of the NFC-F tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_0900', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let SystemCode = NfcFTag.getSystemCode(); 
                expect(SystemCode).assertInstanceOf('Array');
                console.info('[nfc_js] test SystemCode data>:' + SystemCode);
            } else {
                console.info("[NFC_test]NfcFTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1000
         * @tc.name Test getPmm_tagF
         * @tc.desc Obtains the getPmm value of the NFC-F tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1000', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let Pmm = NfcFTag.getPmm(); 
                expect(Pmm).assertInstanceOf('Array');
                console.info('[nfc_js] test Pmm data>:' + Pmm);
            } else {
                console.info("[NFC_test]NfcFTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1100
         * @tc.name Test getResponseFlags_tagV
         * @tc.desc Obtains the ResponseFlags value of the NFC-V tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1100', 0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                let ResponseFlags = NfcVTag.getResponseFlags(); 
                expect(ResponseFlags).assertInstanceOf('Number');
                console.info('[nfc_js] test ResponseFlags3 data>:' + ResponseFlags);
            } else {
                console.info("[NFC_test]NfcVTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1200
         * @tc.name Test getDsfId_tagV
         * @tc.desc Obtains the DsfId value of the NFC-V tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1200', 0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                let DsfId = NfcVTag.getDsfId(); 
                expect(DsfId).assertInstanceOf('Number');
                console.info('[nfc_js] test DsfId data>:' + DsfId);
            } else {
                console.info("[NFC_test]NfcVTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1300
         * @tc.name Test getTagInfo
         * @tc.desc Obtains the DsfId value of the taginfo.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1300', 0, function ()  {
            let TagInfo ;
            try {
                TagInfo = tag.getTagInfo(Want);
                console.info('Nfcget tagABFV gettaginfo is: ' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('Nfcget taginfo error' + error)
                expect(true).assertTrue();
            }
            console.info('[nfc_js] test TagInfo data>:' + TagInfo);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1400
         * @tc.name Test getNfcATag
         * @tc.desc This interface is used to obtain the NFC A tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_1400', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcA(aTag);
            } catch (error) {
                console.info('nfc gertaga error' + error)
            }
            expect(NfcATag != null).assertTrue();
            expect(NfcATag instanceof Object).assertTrue();
            console.info('aTag is--<-!!!->' + JSON.stringify(NfcATag));
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1500
         * @tc.name Test getNfcBTag
         * @tc.desc This interface is used to obtain the NFC B tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1500', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcB(bTag);
            } catch (error) {
                console.info('SUB_Communication_NFC_nfctage_js_0200 error' + error)
            }
            expect(NfcBTag != null).assertTrue();
            expect(NfcBTag instanceof Object).assertTrue();
            console.info('bTag is--<-!!!->' + JSON.stringify(NfcBTag));
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1600
         * @tc.name Test getNfcFTag
         * @tc.desc This interface is used to obtain the NFC F tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1600', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcF(fTag);
            } catch (error) {
                console.info('SUB_Communication_NFC_nfctage_js_0300 error' + error)
            }
            expect(NfcFTag != null).assertTrue();
            expect(NfcFTag instanceof Object).assertTrue();
            console.info('fTag is--<-!!!->' + JSON.stringify(NfcFTag));
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1700
         * @tc.name Test getNfcVTag
         * @tc.desc This interface is used to obtain the NFC V tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1700', 0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcV(vTag);
            } catch (error) {
                console.info('SUB_Communication_NFC_nfctage_js_0400 error' + error)
            }
            expect(NfcVTag != null).assertTrue();
            expect(NfcVTag instanceof Object).assertTrue();
            console.info('vTag is--<-!!!->' + JSON.stringify(NfcVTag));
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


