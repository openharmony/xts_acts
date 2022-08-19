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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

import wifi from '@ohos.wifi'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("wifi_test/wifi status:" + wifi.isWifiActive());
}

let GroupOwnerBand = {
    GO_BAND_AUTO : 0,
    GO_BAND_2GHZ : 1,
    GO_BAND_5GHZ : 2,
}

export default function actsWifiEventTest() {
    describe('actsWifiEventTest', function () {
        beforeEach(function () {
            console.info("beforeEach start" );
            checkWifiPowerOn();
        })
        afterEach(async function () {
            console.info("afterEach start" );
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0008
        * @tc.name testp2pStateChange
        * @tc.desc Test p2pStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0008', 0, async function (done) {
            await wifi.on('p2pStateChange', result => {
                console.info("onP2pStateChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
            setTimeout(function() {
                wifi.off('p2pStateChange', result => {
                    console.info("offP2pStateChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                });
            }, 1 * 1000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0009
        * @tc.name testp2pConnectionChange
        * @tc.desc Test p2pConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0009', 0, async function (done) {
            await wifi.on('p2pConnectionChange', recvP2pConnectionChangeFunc =>  {
                console.info("[wifi_test] p2pConnectionChange result -> " + recvP2pConnectionChangeFunc);
                expect(true).assertEqual(recvP2pConnectionChangeFunc !=null);
                done();
            });
            setTimeout(function() {
                console.info('[wifi_test] offP2pStateChange test start ...');
                wifi.off('p2pConnectionChange', recvP2pConnectionChangeFunc => {
                    console.info("p2pConnectionChange callback" + JSON.stringify(recvP2pConnectionChangeFunc));
                    expect(true).assertEqual(recvP2pConnectionChangeFunc !=null);
                });
            }, 1 * 1000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0012
        * @tc.name testp2pDeviceChange
        * @tc.desc Test p2pDeviceChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0012', 0, async function (done) {
            console.info('[wifi_test] Onp2pDeviceChange test start ...');
            await wifi.on('p2pDeviceChange', result => {
                console.info("onP2pDeviceChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
            setTimeout(function() {
                console.info('[wifi_test] offP2pDeviceChange test start ...');
                wifi.off('p2pDeviceChange', result => {
                    console.info("offP2pStateChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                });
            }, 1 * 1000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0010
        * @tc.name testp2pDeviceChange
        * @tc.desc Test p2pDeviceChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0010', 0, async function (done) {
            let recvP2pPeerDeviceChangeFunc = result => {
                console.info("wifi_test / p2p peer device change receive event: " + JSON.stringify(result));
                wifi.getP2pDevices((err, data) => {
                    if (err) {
                        console.error('wifi_test / failed to get getP2pDevices: ' + JSON.stringify(err));
                        return;
                    }
                    console.info("wifi_test / getP2pDevices [callback] -> " + JSON.stringify(data));
                    let len = Object.keys(data).length;
                    console.log("getP2pDevices number: " + len);
                    for (let i = 0; i < len; ++i) {
                        if (data[i].deviceName === "GRE") {
                            console.info("wifi_test / p2pConnect: -> " + data[i].deviceAddress);
                            let config = {
                                "deviceAddress":data[i].deviceAddress,
                                "netId":-1,
                                "passphrase":"",
                                "groupName":"",
                                "goBand":0,
                            }
                            wifi.p2pConnect(config);
                        }
                    }
                });
            }
            await wifi.on('p2pPeerDeviceChange', result => {
                console.info("onP2pPeerDeviceChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
            setTimeout(function() {
                wifi.off('p2pPeerDeviceChange', result => {
                    console.info("offP2pPeerDeviceChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                });
            }, 1 * 1000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0013
        * @tc.name testp2pPersistentGroupChange
        * @tc.desc Test p2pPersistentGroupChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0013', 0, async function (done) {
            let recvP2pPersistentGroupChangeFunc = () => {
                console.info("wifi_test / p2p persistent group change receive event");
                let config = {
                    "deviceAddress" : "02:11:65:f2:0d:6e",
                    "netId":-2,
                    "passphrase":"",
                    "groupName":"",
                    "goBand":0,
                };
                let addConfig = wifi.createGroup(config);
                expect(addConfig).assertTrue();
                wifi.getCurrentGroup((err, data) => {
                    if (err) {
                        console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                        return;
                    }
                    console.info("wifi_test / get getCurrentGroup [callback] -> " + JSON.stringify(data));
                });
            };
            wifi.on("p2pPersistentGroupChange",recvP2pPersistentGroupChangeFunc);
            setTimeout(async function() {
                wifi.off('p2pPersistentGroupChange', result => {
                    console.info("offP2pPersistentGroupChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                });
            }, 1 * 1000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0011
        * @tc.name testpp2pDiscoveryChange
        * @tc.desc Test p2pDiscoveryChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0011', 0, async function (done) {
            await wifi.on('p2pDiscoveryChange', result => {
                console.info("onp2pDiscoveryChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual((result !=null));
                done();
            });
            setTimeout(function() {
                wifi.off('p2pDiscoveryChange', result => {
                    console.info("offp2pDiscoveryChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                });
            }, 1 * 1000);
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}





