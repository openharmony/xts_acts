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
let aidArray = [160, 0, 0, 1, 81, 0, 0, 0];
let p2 = 0x00;
let command = [128, 202, 159, 127, 0];

export default function channelCallbacktest() {
    describe('channelCallbacktest', function () {
        beforeAll(function () {
            try {
                nfcSEService = secureElement.newSEService("serviceState", (state) => {
                    if (state == secureElement.ServiceState.DISCONNECTED) {
                        console.info("[nfc_test] beforeAll Se_channel state is Disconnected");
                    } else {
                        console.info("[nfc_test] beforeAll Se_channel state is Connected");
                    }
                    expect(state instanceof Object).assertTrue();
                    console.info("[nfc_test] beforeAll Se_channel state is getReaders" + state);
                });
                sleep(1000);
                nfcOmaReaderList = nfcSEService.getReaders();
                if (nfcOmaReaderList.length === 0) {
                    console.info("[NFC_test]This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test] beforeAll Se_channel Result of getReaders:" + nfcOmaReaderList.length);
                    nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test] beforeAll Se_channel getReaders results list 0 is" + nfcESEReader);
                    nfcOmaSession = nfcESEReader.openSession();
                    console.info("[nfc_test] beforeAll Se_channel openSession The result is" + nfcOmaSession);
                }
            } catch (e) {
                console.info("[nfc_test] beforeAll Se_channel occurs exception:" + e.message);
            }
        })

        beforeEach(function() {
            console.info('beforeEach called');
        })

        afterEach(function () {
            console.info('shutdown success');
        })

        afterAll(function () {
            nfcSEService.shutdown();
            sleep(5000);
            console.info('[nfc_test] afterAll channelcallback shutdown success');
        })

       /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2400
         * @tc.name Test isBasicChannel
         * @tc.desc open BasicChannel Check whether the channel is a basic channel.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2400', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]24 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function P2BasicChannel_callback(){
                        return new Promise((resolve, reject) => {
                            nfcOmaSession.openBasicChannel(aidArray, p2,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]24 openBasicChannel data == null" + err);
                                        expect().assertFail();
                                    }
                                    console.info("[NFC_test]24 openBasicChannel data != null " + result);
                                    let P2BasicChannel = result;
                                    let isBasic = P2BasicChannel.isBasicChannel();
                                    console.info("[NFC_test]24 Check whether the channel is a basic channel: " + isBasic);
                                    expect(isBasic).assertTrue();
                                    P2BasicChannel.close();
                                    console.info("[NFC_test]24 Data received by the application select command: " );
                                    resolve();
                                });
                        });
                    }
                    await P2BasicChannel_callback();
                }
            } catch (error) {
                console.info("[NFC_test]24 openBasicChannel_p2_callback occurs exception:" + error);
                expect().assertFail();
            }
            sleep(3000);
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2500
         * @tc.name Test isClosed
         * @tc.desc open LogicalChannel Check whether the channel is closed.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2500', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]25 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            nfcOmaSession.openLogicalChannel(aidArray, p2,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]25 openLogicalChannel data == null" + err);
                                        expect().assertFail();
                                    }
                                    console.info("[NFC_test]25 openLogicalChannel data == null" + result);
                                    let P2LogicalChannel = result;
                                    P2LogicalChannel.close();
                                    console.info("[NFC_test]25 Data received by the application select command: " );
                                    let isChannelClosed = P2LogicalChannel.isClosed();
                                    console.info("[NFC_test]25 Check whether the channel is closed: " + isChannelClosed);
                                    expect(isChannelClosed).assertTrue();
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback();
                }
            } catch (error) {
                console.info("[NFC_test]25 openLogicalChannel_P2_callback occurs exception:" + error);
                expect().assertFail();
            }
            sleep(3000);
            done();
        })


        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2600
         * @tc.name Test getSelectResponse
         * @tc.desc open BasicChannel Returns the data received from the application selection command.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2600', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]26 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function BasicChannel_callback(){
                        return new Promise((resolve, reject) => {
                            nfcOmaSession.openBasicChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]26 to get openBasicChannel:" + JSON.stringify(err));
                                        expect().assertFail();
                                    }
                                    console.info("[NFC_test]26 openBasicChannel data != null " + result);
                                    let nfcBasicChannel = result;
                                    let getResponse = nfcBasicChannel.getSelectResponse();
                                    console.info("[NFC_test]26 getSelectResponse data: " + getResponse);
                                    nfcBasicChannel.close();
                                    console.info("[NFC_test]26 Data received by the application select command: " );
                                    expect(getResponse).assertInstanceOf('Array');
                                    resolve();
                                });
                        });
                    }
                    await BasicChannel_callback();
            }
            } catch (error) {
                console.info("[NFC_test]26 openBasicChannel_callback occurs exception:" + error);
                expect().assertFail();
            }
            sleep(5000);
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2700
         * @tc.name Test transmit
         * @tc.desc open LogicalChannel Send an APDU command to the SE 
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2700', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]27 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    function LogicalChannel_callback(){
                        return new Promise((resolve, reject) => {
                            nfcOmaSession.openLogicalChannel(aidArray,
                                (err, result) => {
                                    if(err) {
                                        console.info("[NFC_test]27 failed to get openLogicalChannel:" + JSON.stringify(err));
                                        expect().assertFail();
                                    }
                                    console.info("[NFC_test]27 openLogicalChannel data != null " + result);
                                    let nfcLogicalChannel = result;
                                    nfcLogicalChannel.transmit(command, (err, data) => {
                                        if (err) {
                                            console.info("[NFC_test]27 Send error an APDU command to the SE: " + err);
                                            expect().assertFail();
                                        } else {
                                            console.info("[NFC_test]27 Send an APDU command to the SE: " + data);
                                            expect(data).assertInstanceOf('Array');
                                        }
                                    });
                                    sleep(5000);
                                    nfcLogicalChannel.close();
                                    console.info("[NFC_test]27 Data received by the application select command: " );
                                    resolve();
                                });
                        });
                    }
                    await LogicalChannel_callback();
                }
            } catch (error) {
                console.info("[NFC_test]27 openLogicalChannel_callback occurs exception:" + error);
                expect().assertFail();
            }
            sleep(3000);
            done();
        })

       /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2800
         * @tc.name Test transmit
         * @tc.desc open LogicalChannel Send an APDU command to the SE 
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2800', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]28 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = nfcOmaSession.openBasicChannel(aidArray);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]28 openBasicChannel openBasicChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]28 openBasicChannel data != null");
                            let OmaBasicChannel = data;
                            OmaBasicChannel.close();
                            console.info("[NFC_test]28 Data received by the application select command: " );
                        }
                        else {
                            console.info("[NFC_test]28 openBasicChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]28 openBasicChannel catch error" + error);
                        expect().assertFail();
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]28 openBasicChannel_Promise occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_Ese_LogicalChannel_js_2900
         * @tc.name Test isClosed
         * @tc.desc Check whether the channel is closed.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_Ese_LogicalChannel_js_2900', 0, async function (done) {
            try {
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]29 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getPromise = nfcOmaSession.openLogicalChannel(aidArray);
                    await getPromise.then((data) => {
                        console.info("[NFC_test]29  openLogicalChannel data: " + data);
                        if ( data != undefined && data != null){
                            console.info("[NFC_test]29 openLogicalChannel data != null");
                            let OmaLogicalChannel = data;
                            let isChannelClosed = OmaLogicalChannel.isClosed();
                            console.info("[NFC_test]29 Check whether the channel is disabled: " + isChannelClosed);
                            expect(isChannelClosed).assertFalse();
                        }
                        else {
                            console.info("[NFC_test]29 openLogicalChannel data == null");
                        }
                    }).catch((error)=> {
                        console.info("[NFC_test]29 openLogicalChannel catch error" + error);
                        expect().assertFail();
                    });
                    sleep(5000);
                }
            } catch (error) {
                console.info("[NFC_test]29 openLogicalChannel_Promise occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}