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
    console.info("[wifi_test]/wifi status:" + wifi.isWifiActive());
}

let groupOwnerBand = {
    GO_BAND_AUTO : 0,
    GO_BAND_2GHZ : 1,
    GO_BAND_5GHZ : 2,
}

export default function actsWifiFunctionTest() {
    describe('actsWifiFunctionTest', function () {
        beforeEach(function () {
            console.info("[wifi_test]beforeEach start" );
            checkWifiPowerOn();
        })
        afterEach(async function () {
            console.info("[wifi_test]afterEach start" );
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0003
        * @tc.name testcreateGroup
        * @tc.desc Test createGroup and getCurrentGroup  infos
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0003', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.log("[wifi_test]check the state of wifi: " + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup promise result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                });
            wifi.getCurrentGroup(
                (err, result) => {
                    if (err) {
                        console.error('[wifi_test]failed to get getCurrentGroup: ' + JSON.stringify(err));
                        expect().assertFail();
                    }else{
                        console.info("[wifi_test]getCurrentGroup callback:" + JSON.stringify(result));
                        console.info("isP2pGo: " + result.isP2pGo +
                        "deviceName: " + result.ownerInfo.deviceName +
                        "deviceAddress: " + result.ownerInfo.deviceAddress +
                        "primaryDeviceType: " + result.ownerInfo.primaryDeviceType +
                        "deviceStatus: " + result.ownerInfo.deviceStatus +
                        "groupCapabilitys: " + result.ownerInfo.groupCapabilitys +
                        "passphrase: " + result.passphrase + "interface: "+ result.interface
                        + "groupName: " + result.groupName +
                        "frequency: " + result.frequency + "goIpAddress: " + result.goIpAddress);
                    }
                });
            let removeGroupResult = wifi.removeGroup();
            expect(removeGroupResult).assertTrue();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0004
        * @tc.name testcreateGroup
        * @tc.desc Test set password createGroup API Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0004', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "1234567",
                groupName: "test_pass",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0104
        * @tc.name testcreateGroup
        * @tc.desc Test set password createGroup API Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0104', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "123@%abcD",
                groupName: "test_pass1",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup  promise result : " + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done()
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0204
        * @tc.name testcreateGroup
        * @tc.desc Test set password createGroup API Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0204', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc3456789012345678901234567890123456789012345678901234567890123",
                groupName: "test_pass2",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup promise result : " + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done()
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0304
        * @tc.name testcreateGroup
        * @tc.desc Test set password createGroup API Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0304', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc34567890123456789012345678901234567890123456789012345678901234",
                groupName: "test_pass3",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup  promise result :" + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0007
        * @tc.name testsethotspot
        * @tc.desc Test createGroup  band setting infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0007', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 1,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            await sleep(2000);
            console.info("[wifi_test] test createGroup3 result." + createGroupResult)
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0107
        * @tc.name testsethotspot
        * @tc.desc Test createGroup  band setting infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0107', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 2,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            await (2000);
            console.info("[wifi_test]test createGroup3 result." + createGroupResult)
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0207
        * @tc.name testsethotspot
        * @tc.desc Test createGroup  band setting infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0207', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            await sleep(2000);
            console.info("[wifi_test]test createGroup3 result." + createGroupResult)
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0307
        * @tc.name testsethotspot
        * @tc.desc Test createGroup  band setting infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0307', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 3,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            await sleep(2000);
            console.info("[wifi_test]test createGroup3 result." + createGroupResult)
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup  promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0008
        * @tc.name testsethotspot
        * @tc.desc Test create P2P error SSID Group  functionality.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0008', 0, async function (done) {
            let groupOwnerBand = {
                GO_BAND_AUTO: 0,
                GO_BAND_2GHZ: 1,
                GO_BAND_5GHZ: 2,
            }
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "12345678",
                groupName: "",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup result:" + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup  promise result : " + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0108
        * @tc.name testsethotspot
        * @tc.desc Test create P2P error SSID Group  functionality.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0108', 0, async function (done) {
            let groupOwnerBand = {
                GO_BAND_AUTO: 0,
                GO_BAND_2GHZ: 1,
                GO_BAND_5GHZ: 2,
            }
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "12345678",
                groupName: " ",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup result:" + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getCurrentGroup promise result :" + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
       * @tc.number SUB_Communication_WiFi_XTS_P2P_0308
       * @tc.name testsethotspot
       * @tc.desc Test create P2P error SSID Group  functionality.
       * @tc.type Function
       * @tc.level Level 0
       */
        it('SUB_Communication_WiFi_XTS_P2P_0308', 0, async function (done) {
            let groupOwnerBand = {
                GO_BAND_AUTO: 0,
                GO_BAND_2GHZ: 1,
                GO_BAND_5GHZ: 2,
            }
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: " ",
                groupName: "testpassword",
                goBand: 0,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup result:" + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                    let removeGroupResult = wifi.removeGroup();
                    expect(removeGroupResult).assertTrue();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0009
        * @tc.name testp2pCancelConnect
        * @tc.desc Test p2pCancelConnect Group  API functionality.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0009', 0, async function (done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ456",
                goBand : 0
            };
            let p2pConnectResult = wifi.p2pConnect(wifiP2PConfig);
            console.info("[wifi_test]test p2pConnect result." + p2pConnectResult);
            let p2pCancelResult = wifi.p2pCancelConnect();
            await sleep(2000);
            console.info("[wifi_test]test p2pCancelConnect result." + p2pCancelResult);
            expect(p2pCancelResult).assertTrue();
            let removeGroupResult = wifi.removeGroup();
            console.info("[wifi_test]test start removeGroup:" + removeGroupResult);
            expect(removeGroupResult).assertTrue();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0011
        * @tc.name testremoveGroup
        * @tc.desc Test remove error Group functionality.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0011', 0, async function (done) {
            let removeGroupResult = wifi.removeGroup(10000);
            console.info("[wifi_test]removeGroup(10000) result : " + JSON.stringify(removeGroupResult));
            expect(removeGroupResult).assertTrue();
            done();
        })

        /**
        * @tc.number     SUB_Communication_WiFi_XTS_P2P_0002
        * @tc.name       testP2pLocalDevice
        * @tc.desc       Test get TO P2pLocalDevice API functionality.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0002', 0, async function (done) {
            await wifi.getP2pLocalDevice()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLocalDevice  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength >= 0);
                }).catch((error) => {
                    console.info("[wifi_test]getP2pLocalDevice promise error." + JSON.stringify(error));
                    expect().assertFail();
                });
            function getP2pLocal(){
                return new Promise((resolve, reject) => {
                    wifi.getP2pLocalDevice(
                        (err, ret) => {
                            if(err) {
                                console.info("[wifi_test]getP2pLocalDevice callback failed : " + JSON.stringify(err));
                                return;
                            }
                            console.info("[wifi_test]getP2pLocalDevice callback result: " + JSON.stringify(ret));
                            console.info("deviceName: " + ret.deviceName + "deviceAddress: " +
                            ret.deviceAddress + "primaryDeviceType: " + ret.primaryDeviceType +
                            "deviceStatus: " + ret.deviceStatus + "groupCapabilitys: " +
                            ret.groupCapabilitys );
                            resolve();
                        });
                });
            }
            await getP2pLocal();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0010
        * @tc.name testgetP2pLinkedInfo
        * @tc.desc Test Test getP2pLinkedInfo  infos
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_P2P_0010', 0, async function(done) {
            let p2pConnectState = {
                DISCONNECTED :0,
                CONNECTED : 1,
            };
            await wifi.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLinkedInfo promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
            function getP2pInfo(){
                return new Promise((resolve, reject) => {
                    wifi.getP2pLinkedInfo(
                        (err, result) => {
                            if(err) {
                                console.info("[wifi_test]failed to getP2pLinkedInfo callback:" + JSON.stringify(err));
                                return;
                            }
                            let resultLength = Object.keys(result).length;
                            console.info("[wifi_test]getP2pLinkedInfo callback:" + JSON.stringify(resultLength));
                            console.info("connectState: " + result.connectState +
                            "isGroupOwner: " + result.isGroupOwner +
                            "groupOwnerAddr: " + result.groupOwnerAddr);
                            expect(true).assertEqual(resultLength!=0);
                            resolve();
                        });
                });
            }
            await getP2pInfo();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0001
        * @tc.name testgetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices promise infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0001', 0, async function(done){
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(2000);
            expect(startDiscover).assertTrue();
            await wifi.getP2pPeerDevices()
                .then((data)  => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pPeerDevices  promise result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength >= 0);
                }).catch((error) => {
                    console.info("[wifi_test]getP2pPeerDevices promise then error." + JSON.stringify(error));
                    expect().assertFail();
                });
            let stopDiscover = wifi.stopDiscoverDevices();
            console.info("[wifi_test]test stopDiscoverDevices result." + stopDiscover);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0101
        * @tc.name testgetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices callback infos
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0101', 0, async function(done){
            let p2pDeviceStatus = {
                CONNECTED : 0,
                INVITED : 1,
                FAILED : 2,
                AVAILABLE : 3,
                UNAVAILABLE : 4,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(2000);
            expect(startDiscover).assertTrue();
            await wifi.getP2pPeerDevices((err, result) => {
                if (err) {
                    console.error('[wifi_test]failed to getP2pPeerDevices infos callback: ' + JSON.stringify(err));
                }else{
                    console.info("[wifi_test] getP2pPeerDevices callback :" + JSON.stringify(result));
                    let len = Object.keys(result).length;
                    for (let j = 0; j < len; ++j) {
                        console.info("deviceName: " + result[j].deviceName +
                        "deviceAddress: " + result[j].deviceAddress +
                        "primaryDeviceType: " + result[j].primaryDeviceType +
                        "deviceStatus: " + result[j].deviceStatus +
                        "groupCapabilitys: " + result[j].groupCapabilitys );
                        if(result[j].deviceStatus ==p2pDeviceStatus.UNAVAILABLE){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==p2pDeviceStatus.CONNECTED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==p2pDeviceStatus.INVITED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==p2pDeviceStatus.FAILED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==p2pDeviceStatus.AVAILABLE){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                    }
                    let stopDiscover = wifi.stopDiscoverDevices();
                    expect(stopDiscover).assertTrue();
                }
                done();
            });
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}
