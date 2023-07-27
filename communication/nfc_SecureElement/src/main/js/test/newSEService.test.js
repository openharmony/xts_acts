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

export default function newSEServicetest() {
    describe('newSEServicetest', function () {
        beforeAll(function () {
            try {
                nfcSEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[nfc_test] beforeAll newService state is Disconnected");
                    } else {
                        console.info("[nfc_test] beforeAll newService state is Connected");
                    }
                    expect(state instanceof Object).assertTrue();
                    console.info("[nfc_test] beforeAll newService state is " + state);
                });
            } catch (e) {
                console.info("[nfc_test] beforeAll newService occurs exception:" + e.message);
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
            console.info('[nfc_test] afterAll newService shutdown success');
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0100
         * @tc.name Test isConnected
         * @tc.desc Check whether the SE service is connected.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0100', 0, function () {
            try {
                let nfcisConnected = nfcSEService.isConnected();
                console.info("[NFC_test]1 SEService The connection status is: " + nfcisConnected);
                expect(nfcisConnected).assertTrue();
            } catch (error) {
                console.info("[NFC_test]1 exception occurred when checking the connection status.:" + error)
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0200
         * @tc.name Test getVersion
         * @tc.desc Returns the version number of the OMA specification.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0200', 0, function ()  {
            try {
                let getSEVersion = nfcSEService.getVersion();
                console.info("[NFC_test]2 OMA The version number is: " + getSEVersion);
                expect(typeof (getSEVersion)).assertEqual('string');
            } catch (error) {
                console.info("[NFC_test]2 Failed to obtain the version.:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0300
         * @tc.name Test getName
         * @tc.desc Returns the name of this reader.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0300', 0, function ()  {
            try {
                let nfcOmaReaderList = nfcSEService.getReaders();
                console.info("[nfc_test]3 Result of getReaders:" + nfcOmaReaderList );
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]3 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    expect(nfcOmaReaderList instanceof Object).assertTrue();
                    let nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test]3 getReaders results list 0 is" + nfcESEReader);
                    expect(nfcESEReader instanceof Object).assertTrue();
                    let getNfcname = nfcESEReader.getName();
                    console.info("[NFC_test]3 The reader name is: " + getNfcname);
                    expect(typeof (getNfcname)).assertEqual('string');
                }
            } catch (error) {
                console.info("[NFC_test]3 getName occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0400
         * @tc.name Test isSecureElementPresent
         * @tc.desc Indicates whether the corresponding secure element is available.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0400', 0, function ()  {
            try {
                let nfcOmaReaderList2 = [];
                nfcOmaReaderList2 = nfcSEService.getReaders();
                if (nfcOmaReaderList2 == undefined) {
                    console.info("[NFC_test]4 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test]4 Result of getReaders:" + nfcOmaReaderList2);
                    expect(nfcOmaReaderList2 instanceof Object).assertTrue();
                    let nfcESEReader2 = nfcOmaReaderList2[0];
                    console.info("[nfc_test]4 getReaders results list 0 is" + nfcESEReader2);
                    expect(nfcESEReader2 instanceof Object).assertTrue();
                    let nfcSePresent = nfcESEReader2.isSecureElementPresent();
                    console.info("[NFC_test]4 security unit check result is: " + nfcSePresent);
                    expect(nfcSePresent).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]4 isSecureElementPresent occurs exception:" + error);
                expect().assertFail();
            }
        })
        
        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0500
         * @tc.name Test shutdown
         * @tc.desc Release all SE resources allocated to the service.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0500', 0, function ()  {
            try {
                nfcSEService.shutdown();
                console.info('[NFC_test] 05 eseshutdown pass');
                let downESEisconnected = nfcSEService.isConnected();
                console.info("[NFC_test]5 shutdown the SE SEService The connection status is: " + downESEisconnected);
                expect(downESEisconnected).assertFalse();
                sleep(5000);
                let SEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[nfc_test]5 Service state is Disconnected");
                    } else {
                        console.info("[nfc_test]5 Service state is Connected");
                    }
                    console.info("[nfc_test]5 Service state is" + state);
                });
                expect(SEService instanceof Object).assertTrue();
                let openESEisconnected = nfcSEService.isConnected();
                console.info("[NFC_test]5  SEService The connection status is:: " + openESEisconnected);
                expect(openESEisconnected).assertTrue();
                let nfcReadersList = SEService.getReaders();
                if (nfcReadersList == undefined) {
                    console.info("[NFC_test]5 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    expect(nfcReadersList instanceof Object).assertTrue();
                    console.info("[nfc_test]5 Result of getReaders:" + nfcReadersList);
                }
            } catch (error) {
                console.info("[NFC_test]5 getReaders occurs exception:" + error);
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}