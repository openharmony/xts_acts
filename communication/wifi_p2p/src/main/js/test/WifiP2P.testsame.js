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

function sleep(delay) { // delay x ms
    var start = (new Date()).getTime();
    while ((new Date()).getTime() - start > delay) {
        break;
    }
}

function checkWifiPowerOn(){
    console.info("wifi_test/wifi status:" + wifi.isWifiActive());
}

let GroupOwnerBand = {
    GO_BAND_AUTO : 0,
    GO_BAND_2GHZ : 1,
    GO_BAND_5GHZ : 2,
}

export default function actsWifiTest() {
    describe('actsWifiTest', function () {
        beforeEach(function () {
            console.info("beforeEach start" );
            checkWifiPowerOn();
        })
        afterEach(async function () {
            console.info("afterEach start" );
        })

        /**
        * @tc.number     P2P_Config_0001
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0001
        * @tc.desc       Test createGroup and getCurrentGroup promise infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0001', 0, async function(done) {
            let WifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0
            };
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let addConfig = wifi.createGroup(WifiP2PConfig);
            console.info("[wifi_test] test createGroup end." + addConfig);
            sleep(2000);
            expect(addConfig).assertTrue();
            wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  [promise] result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeConfig = wifi.removeGroup();
                    expect(removeConfig).assertTrue();
                });
            done()
        })

        /**
        * @tc.number     P2P_Config_0002
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0002
        * @tc.desc       Test getCurrentGroup callback infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_Config_0002', 0, async function(done) {
            let WifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0
            };

            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let addConfig = wifi.createGroup(WifiP2PConfig);
            sleep(2000);
            console.log("[wifi_test]  check the state of wifi: " + addConfig);
            expect(addConfig).assertTrue();
            wifi.getCurrentGroup(
                (err, result) => {
                    if (err) {
                        console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                        expect().assertFail();
                    }else{
                        console.info("[wifi_test] getCurrentGroup [callback] -> " + JSON.stringify(result));
                        // console.info("isP2pGo: " + result.isP2pGo +
                        // "deviceName: " + result.ownerInfo.deviceName +
                        // "deviceAddress: " + result.ownerInfo.deviceAddress +
                        // "primaryDeviceType: " + result.ownerInfo.primaryDeviceType +
                        // "deviceStatus: " + result.ownerInfo.deviceStatus +
                        // "groupCapabilitys: " + result.ownerInfo.groupCapabilitys +
                        // "passphrase: " + result.passphrase + "interface: "+ result.interface
                        // + "groupName: " + result.groupName +
                        // "clientDevices: " + result.clientDevices +"networkId: " + result.networkId
                        //  + "frequency: " + result.frequency + "goIpAddress: " + result.goIpAddress);
                        let removeConfig = wifi.removeGroup();
                        expect(removeConfig).assertTrue();
                    }
                    done();
                });
        })

        /**
        * @tc.number     P2P_Config_0003
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0003
        * @tc.desc       Test createGroup 2.4G band and getCurrentGroup infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0003', 0, async function(done) {
            let WifiP2PConfig2 = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 1
            };
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let addConfig = wifi.createGroup(WifiP2PConfig2);
            sleep(2000);
            console.info("[wifi_test] test createGroup3 result." + addConfig)
            expect(addConfig).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  [promise] result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeConfig = wifi.removeGroup();
                    expect(removeConfig).assertTrue();
                });
            done()
        })

        /**
        * @tc.number     P2P_Config_0004
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0004
        * @tc.desc       Test create PersistentGroup infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0004', 0, async function(done) {
            let WifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -2,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0
            };
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let addConfig = wifi.createGroup(WifiP2PConfig);
            sleep(2000);
            console.info("[wifi_test] test p2pConnect result." + addConfig);
            expect(addConfig).assertTrue();
            await wifi.getCurrentGroup()
                .then((data)  => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getCurrentGroup  [promise] result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    let removeConfig = wifi.removeGroup();
                    expect(removeConfig).assertTrue();
                });
            done();
        })

        /**
        * @tc.number     P2P_Config_0005
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0005
        * @tc.desc       Test p2pConnect infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_Config_0005', 0, async function(done) {
            let WifiP2PConfig3 = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -2,
                passphrase : "12345678",
                groupName : "AAAZZZ",
                goBand : 2
            };
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let scanConfig = wifi.startDiscoverDevices();
            sleep(2000);
            expect(scanConfig).assertTrue();

            let connConfig = wifi.p2pConnect(WifiP2PConfig3);
            console.info("[wifi_test] test p2pConnect result." + connConfig);
            expect(connConfig).assertTrue();
            let stopScan = wifi.stopDiscoverDevices();
            console.info("[wifi_test] test stopDiscoverDevices result." + stopScan);
            done()
        })

        /**
        * @tc.number     P2P_Config_0006
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0006
        * @tc.desc       Test getP2pLinkedInfo promise infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0006', 0, async function(done) {
            await wifi.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getP2pLinkedInfo  [promise] result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
        })

        /**
        * @tc.number     P2P_Config_0007
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0007
        * @tc.desc       Test getP2pLinkedInfo callback infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0007', 0, async function(done) {
            let P2pConnectState = {
                DISCONNECTED :0,
                CONNECTED : 1,
            };
            function getP2pInfo(){
                return new Promise((resolve, reject) => {
                    wifi.getP2pLinkedInfo(
                        (err, result) => {
                            if(err) {
                                console.info("[wifi_test]failed to getP2pLinkedInfo callback" + JSON.stringify(err));
                                return;
                            }
                            let resultLength = Object.keys(result).length;
                            console.info("[wifi_test] getP2pLinkedInfo [callback] -> " + JSON.stringify(resultLength));
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
        * @tc.number     P2P_Config_0008
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0008
        * @tc.desc       Test p2pCancelConnect infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_Config_0008', 0,  async function(done) {
            let disConn = wifi.p2pCancelConnect();
            sleep(2000);
            console.info("[wifi_test] test p2pCancelConnect result." + disConn);
            expect(disConn).assertTrue();
            let removeConfig = wifi.removeGroup();
            console.info("[wifi_test] test start removeGroup" + removeConfig);
            expect(removeConfig).assertTrue();
            done();
        })

        /**
        * @tc.number     P2P_Config_0009
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0009
        * @tc.desc       Test getP2pPeerDevices promise infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_Config_0009', 0, async function(done){
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let scanConfig = wifi.startDiscoverDevices();
            sleep(2000);
            expect(scanConfig).assertTrue();
            await wifi.getP2pPeerDevices()
                .then((data)  => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getP2pPeerDevices  [promise] result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength >= 0);
                }).catch((error) => {
                    console.info("[wifi_test]getP2pPeerDevices promise then error." + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })

        /**
        * @tc.number     P2P_Config_0010
        * @tc.name       SUB_Communication_WiFi_P2P_Config_0010
        * @tc.desc       Test getP2pPeerDevices callback infos
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_Config_0010', 0, async function(done){
            let P2pDeviceStatus = {
                CONNECTED : 0,
                INVITED : 1,
                FAILED : 2,
                AVAILABLE : 3,
                UNAVAILABLE : 4,
            };
            console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let scanConfig = wifi.startDiscoverDevices();
            sleep(2000);
            expect(scanConfig).assertTrue();
            await wifi.getP2pPeerDevices((err, result) => {
                if (err) {
                    console.error('failed to getP2pPeerDevices infos callback because ' + JSON.stringify(err));
                }else{
                    console.info("[wifi_test] getP2pPeerDevices [callback] -> " + JSON.stringify(result));
                    let len = Object.keys(result).length;
                    for (let j = 0; j < len; ++j) {
                        console.info("deviceName: " + result[j].deviceName +
                        "deviceAddress: " + result[j].deviceAddress +
                        "primaryDeviceType: " + result[j].primaryDeviceType +
                        "deviceStatus: " + result[j].deviceStatus +
                        "groupCapabilitys: " + result[j].groupCapabilitys );
                        if(result[j].deviceStatus ==P2pDeviceStatus.UNAVAILABLE){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==P2pDeviceStatus.CONNECTED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==P2pDeviceStatus.INVITED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==P2pDeviceStatus.FAILED){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                        if(result[j].deviceStatus ==P2pDeviceStatus.AVAILABLE){
                            console.info("deviceStatus: " + result[j].deviceStatus);
                        }
                    }
                    let stopScan = wifi.stopDiscoverDevices();
                    expect(stopScan).assertTrue();
                }
                done();
            });
        })

        /**
        * @tc.number     P2P_P2pStateChange_0001
        * @tc.name       SUB_Communication_WiFi_P2P_P2pStateChange_0001
        * @tc.desc       Test p2pStateChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_P2pStateChange_0001', 0, async function (done) {
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
        * @tc.number     p2pConnectionChange_0002
        * @tc.name       SUB_Communication_WiFi_P2P_p2pConnectionChange_0002
        * @tc.desc       Test p2pConnectionChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_p2pConnectionChange_0002', 0, async function (done) {
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
        * @tc.number     P2P_p2pDeviceChange_0003
        * @tc.name       SUB_Communication_WiFi_P2P_p2pDeviceChange_0003
        * @tc.desc       Test p2pDeviceChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_p2pDeviceChange_0003', 0, async function (done) {
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
        * @tc.number     P2P_p2pPeerDeviceChange_0004
        * @tc.name       SUB_Communication_WiFi_P2P_p2pPeerDeviceChange_0004
        * @tc.desc       Test p2pDeviceChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION
        */
        it('SUB_Communication_WiFi_P2P_p2pPeerDeviceChange_0004', 0, async function (done) {
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
        * @tc.number     P2P_p2pPersistentGroupChange_0005
        * @tc.name       SUB_Communication_WiFi_P2P_p2pPersistentGroupChange_0005
        * @tc.desc       Test p2pPersistentGroupChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_p2pPersistentGroupChange_0005', 0, async function (done) {
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
        * @tc.number     P2P_p2pDiscoveryChange_0006
        * @tc.name       SUB_Communication_WiFi_P2P_p2pDiscoveryChange_0006
        * @tc.desc       Test p2pDiscoveryChange callback
        * @since 8
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_P2P_p2pDiscoveryChange_0006', 0, async function (done) {
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





