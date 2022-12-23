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

import wifiMg from '@ohos.wifiManager'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifiMg.isWifiActive());
}

export default function actsWifiManagerEventTest() {
    describe('actsWifiManagerEventTest', function () {
        beforeEach(function () {
            console.info("[wifi_test]beforeEach start" );
            checkWifiPowerOn();
        })
        afterEach(async function () {
            console.info("[wifi_test]afterEach start" );
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0008
        * @tc.name testp2pStateChange
        * @tc.desc Test p2pStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0008', 0, async function (done) {
            let p2pState = "p2pStateChange";
            let p2pStateChangeCallback = result => {
                console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pState, p2pStateChangeCallback);
            await sleep(3000);
            wifiMg.off(p2pState, p2pStateChangeCallback);
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
            let p2pConnectionState = "p2pConnectionChange";
            let p2pConnectionChangeCallback = result => {
                console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pConnectionState, p2pConnectionChangeCallback);
            let p2pConnectState = {
                DISCONNECTED :0,
                CONNECTED : 1,
            };
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ456",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO,
            };
            let connectResult = wifiMg.p2pConnect(wifiP2PConfig);
            await wifiMg.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLinkedInfo  promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
            await sleep(2000);
            wifiMg.off(p2pConnectionState, p2pConnectionChangeCallback);
            let removeGroupResult = wifiMg.removeGroup();
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
            let p2pDeviceState = "p2pDeviceChange";
            let p2pDeviceChangeCallback = result => {
                console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pDeviceState, p2pDeviceChangeCallback);
            await sleep(3000);
            wifiMg.off(p2pDeviceState, p2pDeviceChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0010
        * @tc.name testp2pPeerDeviceChange
        * @tc.desc Test p2pPeerDeviceChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0010', 0, async function (done) {
            let p2pPeerDeviceState = "p2pPeerDeviceChange";
            let p2pPeerDeviceChangeCallback = result => {
                console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
            let startDiscover = wifiMg.startDiscoverDevices();
            await sleep(3000);
            let stopDiscover = wifiMg.stopDiscoverDevices();
            wifiMg.off(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
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
            let p2pGroupState = "p2pPersistentGroupChange";
            let p2pPersistentGroupChangeCallback = () => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pGroupState, p2pPersistentGroupChangeCallback);
            let WifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -2,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO,
            };
            let createGroupResult = wifiMg.createGroup(WifiP2PConfig);
            await (2000);
            await wifiMg.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  promise result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                });
            wifiMg.off(p2pGroupState, p2pPersistentGroupChangeCallback);
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
            let p2pPeerDeviceState = "p2pDiscoveryChange";
            let p2pDiscoveryChangeCallback = result => {
                console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
            let startDiscover = wifiMg.startDiscoverDevices();
            await sleep(3000);
            let stopDiscover = wifiMg.stopDiscoverDevices();
            wifiMg.off(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}


