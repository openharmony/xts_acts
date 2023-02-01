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
import controller from '@ohos.nfc.controller';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

let NfcState={
    STATE_OFF : 1,
    STATE_TURNING_ON : 2,
    STATE_ON : 3,
    STATE_TURNING_OFF : 4,
}

export default function nfcControllerTest() {
    describe('nfcControllerTest', function () {
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
         * @tc.number SUB_COMMUNICATION_NFC_Cont_0100
         * @tc.name Test on_off_openNfcapi
         * @tc.desc Register the NFC switch status event and enable the NFC switch.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_NFC_Cont_0100', 0, function () {
            let NFC_STATE_NOTIFY = "nfcStateChange";
            let recvNfcStateNotifyFunc = result => {
                console.info("nfc state receive state ->" + result);
                expect(result != null).assertTrue();
            }
            controller.on(NFC_STATE_NOTIFY, recvNfcStateNotifyFunc);
            controller.off(NFC_STATE_NOTIFY, recvNfcStateNotifyFunc);
        })
    
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_0200
         * @tc.name Test isNfcAvailableapi
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_NFC_Cont_0200', 0, function ()  {
            let nfcisAvailable = controller.isNfcAvailable();
            expect(nfcisAvailable).assertTrue();
            console.info('[nfc_js]  Nfc Available ->' + JSON.stringify(nfcisAvailable));
        })
    
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_0300
         * @tc.name Test isNfcOpenapi
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_NFC_Cont_0300', 0, function ()  {
            let nfcswitchis = controller.isNfcOpen();
            expect(nfcswitchis).assertTrue();
            console.info('[nfc_js]  Nfc isopen state is ->' + JSON.stringify(nfcswitchis));
        })
    
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_0400
         * @tc.name Test isNfcAvailable_isNfcOpenapi
         * @tc.desc Check whether the NFC function is enabled on the device.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_NFC_Cont_0400', 0, function ()  {
            let nfcisAvailable1 = controller.isNfcAvailable();
            expect(nfcisAvailable1).assertTrue();
            console.info('[nfc_js]  NfcAvailable 1 ->' + JSON.stringify(nfcisAvailable1));
            let nfcenable1 = controller.isNfcOpen();
            expect(nfcenable1).assertTrue();
            console.info('[nfc_js]  Nfc isopen 1 state is ->' + JSON.stringify(nfcenable1));
        })
    
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_0500
         * @tc.name Test getNfcStateapi
         * @tc.desc Querying the Status When NFC Is Enabled
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_COMMUNICATION_NFC_Cont_0500', 0, function ()  {
            let checkopennfc = controller.getNfcState();
            expect(checkopennfc).assertEqual(NfcState.STATE_ON);
            console.log("[nfc_test]  checkopen the state of nfc-> " + JSON.stringify(checkopennfc));
        })

        console.log("*************[nfc_test] start nfc js unit test end*************");
    })
}




