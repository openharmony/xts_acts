/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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


import secureElement from '@ohos.secureElement';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

let nfcSEService = null;
let nfcESEReader = null;
let nfcOmaSession = null;
let nfcOmaReaderList = [];

export default function openSessionTest() {
    describe('openSessionTest', function () {
        beforeAll(function () {
            try {
                nfcSEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[nfc_test] beforeAll Se_session state is Disconnected");
                    } else {
                        console.info("[nfc_test] beforeAll Se_session state is Connected");
                    }
                    expect(state instanceof Object).assertTrue();
                    console.info("[nfc_test] beforeAll Se_session state is getReaders" + state);
                });
                nfcOmaReaderList = nfcSEService.getReaders();
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test] beforeAll Se_session Result of getReaders:" + nfcOmaReaderList.length);
                    nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test] beforeAll Se_session getReaders results list 0 is" + nfcESEReader);
                    nfcOmaSession = nfcESEReader.openSession();
                    console.info("[nfc_test] beforeAll Se_session openSession The result is" + nfcOmaSession);
                }
            } catch (e) {
                console.info("[nfc_test] beforeAll Se_session occurs exception:" + e.message);
            }
        })
        beforeEach(function() {
            console.info('beforeEach called');
        })
        afterEach(function () {
            console.info('afterEach called');
        })
        afterAll(function () {
            nfcSEService.shutdown();
            console.info('[nfc_test] afterAll Se_session shutdown success');
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0600
         * @tc.name Test getReader
         * @tc.desc Obtains the reader that provides the session.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0600', 0, async function ( ) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]6 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getNfcreader = nfcOmaSession.getReader();
                    console.info("[NFC_test]6 Reader result of this session: " + getNfcreader);
                    expect(getNfcreader instanceof Object).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]6 The reader result of the session is abnormal:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0700
         * @tc.name Test getATR
         * @tc.desc Obtain the ATR of the SE.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0700', 0, function ()  {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]7 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let nfcGetart = nfcOmaSession.getATR();
                    expect(nfcGetart).assertInstanceOf('Array');
                    expect(!nfcGetart == false ).assertTrue();
                    console.info("[NFC_test]7 Get the ATR of this SE: " + nfcGetart);
                }
            } catch (error) {
                console.info("[NFC_test]7 Get the ATR of this SE occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0800
         * @tc.name Test close Session
         * @tc.desc Close a single session.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0800', 0, function ()  {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]8 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let nfcOmaSession2 = nfcESEReader.openSession();
                    console.info("[nfc_test]8 Open the second session result" + nfcOmaSession2);
                    expect(nfcOmaSession2 instanceof Object).assertTrue();
                    let iscloseChannel1 = nfcOmaSession.isClosed();
                    console.info("[NFC_test]8 Check the first one session is open: " + iscloseChannel1);
                    expect(iscloseChannel1).assertFalse();
                    let iscloseChannel2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]8 Check the second session is open: " + iscloseChannel2);
                    expect(iscloseChannel2).assertFalse();
                    nfcOmaSession2.close();
                    console.info("[NFC_test]8 second session is closed successfully");
                    let opencloseChannel1 = nfcOmaSession.isClosed();
                    console.info("[NFC_test]8 After close Check the first one session is open: " + opencloseChannel1);
                    expect(opencloseChannel1).assertFalse();
                    let opencloseChannel2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]8 After close Check the second session is open: " + opencloseChannel2);
                    expect(opencloseChannel2).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]8 0800 occurs exception:" + error);
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}