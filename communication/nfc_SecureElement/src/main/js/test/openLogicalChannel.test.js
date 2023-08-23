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

export default function openLogicalChanneltest() {
    describe('openLogicalChanneltest', function () {
        beforeAll(async function (done) {
            try {
                nfcSEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[NFC_test] se_Logical Opened successfully");
                    } else {
                        console.info("[NFC_test] se_Logical Failed to open");
                    }
                    expect(state instanceof Object).assertTrue();
                });
                sleep(1000);
                nfcOmaReaderList = nfcSEService.getReaders();
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test] beforeAll se_Logical Result of getReaders:" + nfcOmaReaderList.length);
                    nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test] beforeAll se_Logical getReaders results list 0 is" + nfcESEReader);
                    nfcOmaSession = nfcESEReader.openSession();
                    console.info("[nfc_test] beforeAll se_Logical openSession The result is" + nfcOmaSession);
                    let getPromise = nfcOmaSession.openLogicalChannel(aidArray, p2);
                    await getPromise.then((data) => {
                        console.info("[NFC_test] beforeAll se_Logical openLogicalChannel data: " + data);
                        return nfcOmaChannel = data;
                    }).catch((error)=> {
                        console.info("[NFC_test] beforeAll se_Logical openLogicalChannel catch error: " + error);
                        expect().assertFail();
                        done();
                    });
                    sleep(5000);
                }
            } catch (e) {
                console.info("[NFC_test] beforeAll se_Logical occurs exception:" + e.message);
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
            sleep(5000);
            console.info('shutdown success');
        })

       /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1700
         * @tc.name Test isBasicChannel
         * @tc.desc Check whether the channel is a basic channel.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1700', 0, function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]17 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let isBasic = nfcOmaChannel.isBasicChannel();
                    console.info("[NFC_test]17 Check whether the channel is a basic channel: " + isBasic);
                    expect(isBasic).assertFalse();
                }
            } catch (error) {
                console.info("[NFC_test]17 isBasicChannel occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1800
         * @tc.name Test isClosed
         * @tc.desc Check whether the channel is closed.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1800', 0, function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]18 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let isChannelClosed = nfcOmaChannel.isClosed();
                    console.info("[NFC_test]18 Check whether the channel is closed: " + isChannelClosed);
                    expect(isChannelClosed).assertFalse();
                }
            } catch (error) {
                console.info("[NFC_test]18 isClosed occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_1900
         * @tc.name Test getSelectResponse
         * @tc.desc Returns the data received from the application selection command.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_1900', 0, function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]19 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getResponse = nfcOmaChannel.getSelectResponse();
                    console.info("[NFC_test]19 Data received by the application select command: " + getResponse);
                    expect(getResponse).assertInstanceOf('Array');
                }
            } catch (error) {
                console.info("[NFC_test]19 getSelectResponse occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2000
         * @tc.name Test transmit
         * @tc.desc Send an APDU command to the SE
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2000', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]20 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    nfcOmaChannel.transmit(command, (err, data) => {
                        if (err) {
                            console.info("[NFC_test]20 Send error an APDU command to the SE: " + err);
                            expect().assertFail();
                        } else {
                            console.info("[NFC_test]20 Send an APDU command to the SE: " + data);
                            expect(data).assertInstanceOf('Array');
                        }
                    });
                }
            } catch (error) {
                console.info("[NFC_test]19 exception when sending the APDU command to the SE:" + error);
                expect().assertFail();
            }
            sleep(5000);
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2100
         * @tc.name Test transmit
         * @tc.desc Send an APDU command to the SE 
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2100', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]21 This function is not supported because the phone NFC chip is ST chip.");
                    done();
                } else {
                    let getPromise = nfcOmaChannel.transmit(command);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]21 secureElement transmit data: " + data);
                        expect(data).assertInstanceOf('Array');
                        done();
                    }).catch((err)=> {
                        console.info("[NFC_test]21 secureElement transmit err: " + err);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info("[NFC_test]21 exception when sending the APDU command to the SE:" + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2200
         * @tc.name Test close
         * @tc.desc Obtains the session object that opens the channel.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2200', 0, function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]22 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getchannelSession = nfcOmaChannel.getSession();
                    expect(getchannelSession instanceof Object).assertTrue();
                    console.info("[NFC_test]22 getSession data: " + getchannelSession);
                }
            } catch (error) {
                console.info("[NFC_test]22 getSession occurs exception:" + error);
                expect().assertFail();
            }
        })

        
        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2300
         * @tc.name Test getNfcATag
         * @tc.desc This interface is used to obtain the NFC A tag object.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2300', 0, function () {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.log("[NFC_test]23 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    nfcOmaSession.closeChannels();
                    console.info("[NFC_test] 23 The closeChannel test is successfully" );
                    let isChannelClosed = nfcOmaChannel.isClosed();
                    console.info("[NFC_test]23 Check whether the channel is disabled: " + isChannelClosed);
                    expect(isChannelClosed).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]23 close and isclosed occurs exception:" + error);
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}