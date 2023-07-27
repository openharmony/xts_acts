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
let nfcOmaChannel = null;
let nfcOmaReaderList = [];
let aidArray = [160, 0, 0, 1, 81, 0, 0, 0];
let p2 = 0x00;
let command = [128, 202, 159, 127, 0];

export default function openBasicChanneltest() {
    describe('openBasicChanneltest', function () {
        beforeAll(async function (done) {
            try {
                nfcSEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[NFC_test] beforeAll se_basic Opened successfully");
                    } else {
                        console.info("[NFC_test] beforeAll se_basic Failed to open");
                    }
                    expect(state instanceof Object).assertTrue();
                });
                nfcOmaReaderList = nfcSEService.getReaders();
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test] beforeAll se_basic Result of getReaders:" + nfcOmaReaderList.length);
                    nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test] beforeAll se_basic getReaders results list 0 is" + nfcESEReader);
                    nfcOmaSession = nfcESEReader.openSession();
                    console.info("[nfc_test] beforeAll se_basic openSession The result is" + nfcOmaSession);
                    let getPromise = nfcOmaSession.openBasicChannel(aidArray, p2);
                    await getPromise.then((data) => {
                        console.info("[NFC_test] beforeAll se_basic openBasicChannel data: " + data);
                        return nfcOmaChannel = data;
                        // if ( data != undefined && data != null){
                        //     console.info("[NFC_test] beforeAll se_basic openBasicChannel data != null" + nfcOmaChannel);
                        //     return nfcOmaChannel = data;
                        // }
                        // else {
                        //     console.info("[NFC_test] beforeAll se_basic openBasicChannel data == null");
                        // }
                    })
                    sleep(5000);
                }
            } catch (e) {
                console.info("[NFC_test] beforeAll se_basic occurs exception:" + e.message);
                expect().assertFail();
            }
            done();
            console.info('beforeAll called');
        })

        beforeEach(function() {
            console.info('beforeEach called');
        })

        afterEach(function () {
            console.info('afterEach called');
        })

        afterAll(function () {
            nfcSEService.shutdown();
            console.info('shutdown success');
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1000
         * @tc.name Test isBasicChannel
         * @tc.desc Check whether the channel is a basic channel.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1000', 0, async function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]10 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let isBasic = nfcOmaChannel.isBasicChannel();
                    console.info("[NFC_test]10 Check whether the channel is a basic channel: " + isBasic);
                    expect(isBasic).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]10 isBasicChannel occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1100
         * @tc.name Test isClosed
         * @tc.desc Check whether the channel is closed.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1100', 0, async function ( ) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]11 This function is not supported because the phone NFC chip is ST chip.");;
                } else {
                    let isChannelClosed = nfcOmaChannel.isClosed();
                    console.info("[NFC_test]11 Check whether the channel is closed: " + isChannelClosed);
                    expect(isChannelClosed).assertFalse();
                }
            } catch (error) {
                console.info("[NFC_test]11 isClosed occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1200
         * @tc.name Test getSelectResponse
         * @tc.desc Returns the data received from the application selection command.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1200', 0, async function ( ) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]12 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getResponse = nfcOmaChannel.getSelectResponse();
                    console.info("[NFC_test]12 Data received by the application select command: " + getResponse);
                    expect(getResponse).assertInstanceOf('Array');
                }
            } catch (error) {
                console.info("[NFC_test]12 getSelectResponse occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1300
         * @tc.name Test transmit
         * @tc.desc Send an APDU command to the SE
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1300', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]13 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    nfcOmaChannel.transmit(command, (err, data) => {
                        if (err) {
                            console.info("[NFC_test]13 Send error an APDU command to the SE: " + err);
                            expect().assertFail();
                        } else {
                            console.info("[NFC_test]13 Send an APDU command to the SE: " + data);
                            expect(data).assertInstanceOf('Array')
                        }
                    });
                }
            } catch (error) {
                console.info("[NFC_test]13 exception when sending the APDU command to the SE:" + error);
                expect().assertFail();
            }
            sleep(5000);
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1400
         * @tc.name Test transmit
         * @tc.desc Send an APDU command to the SE 
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1400', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]14 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = nfcOmaChannel.transmit(command);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]14 Send an APDU command to the SE:" + data);
                        expect(data).assertInstanceOf('Array');
                    }).catch((err)=> {
                        console.info("[NFC_test]14 Send error an APDU command to the SE:: " + err);
                        expect().assertFail();
                    });
                }
            } catch (error) {
                console.info("[NFC_test]14 exception when sending the APDU command to the SE:" + error);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1500
         * @tc.name Test close
         * @tc.desc Obtains the session object that opens the channel.
         * @tc.type Function
         * @tc.level Level 2
         */
            it('SUB_Communication_Ese_BasicChannel_js_1500', 0, async function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]15 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getchannelSession = nfcOmaChannel.getSession();
                    expect(getchannelSession instanceof Object).assertTrue();
                    console.info("[NFC_test] 15 getSession data: " + getchannelSession);
                }
            } catch (error) {
                console.info("[NFC_test]15 getSession occurs exception:" + error);
                expect().assertFail();
            }
        })
        
        
        /**
         * @tc.number SUB_Communication_Ese_BasicChannel_js_1600
         * @tc.name Test close
         * @tc.desc Close the channel with the SE.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_BasicChannel_js_1600', 0, async function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]16 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    nfcOmaChannel.close();
                    console.info("[NFC_test] 1600 The closeChannel test is successfully" );
                    let isChannelClosed = nfcOmaChannel.isClosed();
                    console.info("[NFC_test]16 Check whether the channel is disabled: " + isChannelClosed);
                    expect(isChannelClosed).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]16 close and isclosed occurs exception:" + error);
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}