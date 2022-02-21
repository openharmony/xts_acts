/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

import wifi from '@ohos.wifi'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}


var GroupOwnerBand = {
    GO_BAND_AUTO : 0,
    GO_BAND_2GHZ : 1,
    GO_BAND_5GHZ : 2,
}

describe('ACTS_WifiTest', function () {
    beforeEach(function () {
    })

    afterEach(function () {
    })

    /**
    * @tc.number     Setting_0001
    * @tc.name       SUB_Communication_WiFi_P2P_Setting_0001
    * @tc.author wudangping wwx1075776
    * @tc.desc       Test setDeviceName infos
    */
    it('SUB_Communication_WiFi_P2P_Setting_0001', 0,  function() {
        console.info("[wifi_test] test setDeviceName start.");
        var devName = wifi.setDeviceName("P2PTest");
        console.info("[wifi_test] test start setDeviceName->" + devName);
        expect(devName).assertTrue();
    })

    /**
    * @tc.number     config_0001
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0001
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test createGroup and getCurrentGroup infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0001', 0, async function(done) {
        var WifiP2PConfig = {
            deviceAddress : "02:11:65:f2:0d:6e",
            netId : -1,
            passphrase : "12345678",
            groupName : "AAAZZZ",
            goBand : 0
        };
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if(!active){
            var enable = wifi.enableWifi();
            await sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
        console.info("[wifi_test] test start createGroup .");
        var addConfig = wifi.createGroup(WifiP2PConfig);
        await sleep(2000);
        console.info("[wifi_test] test start createGroup result." + addConfig);
        expect(addConfig).assertTrue();
        await wifi.getCurrentGroup()
            .then((data)  => {
            console.info("[wifi_test] getCurrentGroup [promise] result -> " + JSON.stringify(data));
            expect(true).assertEqual(data.length!=0);
        }).catch((error) => {
            console.info("[wifi_js]getCurrentGroup promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
        wifi.getCurrentGroup(
            (err, result) => {
                if (err) {
                    console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                    return;
                }
                console.info("[wifi_test] getCurrentGroup [callback] -> " + JSON.stringify(result));
                console.info("isP2pGo: " + result.isP2pGo);
                console.info("deviceName: " + result.ownerInfo.deviceName);
                console.info("deviceAddress: " + result.ownerInfo.deviceAddress);
                console.info("primaryDeviceType: " + result.ownerInfo.primaryDeviceType);
                console.info("deviceStatus: " + result.ownerInfo.deviceStatus);
                console.info("groupCapabilitys: " + result.ownerInfo.groupCapabilitys);
                console.info("passphrase: " + result.passphrase);
                console.info("interface: " + result.interface);
                console.info("groupName: " + result.groupName);
                console.info("clientDevices: " + result.clientDevices);
                console.info("networkId: " + result.networkId);
                console.info("frequency: " + result.frequency);
                console.info("goIpAddress: " + result.goIpAddress);
                console.info("[wifi_test] test start removeGroup");
                var removeConfig = wifi.removeGroup();
                console.info("[wifi_test] test start removeGroup" + removeConfig);
                expect(removeConfig).assertTrue();
                done();
            });
    })

    /**
    * @tc.number     config_0002
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0002
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test createGroup 2.4G band and getCurrentGroup infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0002', 0, async function(done) {
        var WifiP2PConfig2 = {
            deviceAddress : "02:11:65:f2:0d:6e",
            netId : -1,
            passphrase : "12345678",
            groupName : "AAAZZZ",
            goBand : 1
        };
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if(!active){
            var enable = wifi.enableWifi();
            await sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
        console.info("[wifi_test] test start create 2.4G band Group .");
        var addConfig = wifi.createGroup(WifiP2PConfig2);
        await sleep(2000);
        console.info("[wifi_test] test start createGroup result." + addConfig);
        expect(addConfig).assertTrue();
        await wifi.getCurrentGroup()
            .then((data)  => {
                console.info("[wifi_test] getCurrentGroup  [promise] result -> " + JSON.stringify(data));
                expect(true).assertEqual(data.length!=0);
                expect(true).assertEqual(data.goBand == WifiP2PConfig2.goBand);
        }).catch((error) => {
                console.info("[wifi_test]getCurrentGroup promise then error." + JSON.stringify(error));
                expect(error).assertFail();
        });
        console.info("[wifi_test] test start removeGroup");
        var removeConfig = wifi.removeGroup();
        console.info("[wifi_test] test start removeGroup" + removeConfig);
        expect(removeConfig).assertTrue();
        done();
    })

    /**
    * @tc.number     config_0003
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test createGroup and deletePersistentGroup infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0003', 0, async function(done) {
        var WifiP2PConfig = {
            deviceAddress : "02:11:65:f2:0d:6e",
            netId : -2,
            passphrase : "12345678",
            groupName : "AAAZZZ",
            goBand : 0
        };
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if(!active){
            var enable = wifi.enableWifi();
            await sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
        console.info("[wifi_test] test start createGroup [promise].");
        var addConfig = wifi.createGroup(WifiP2PConfig);
        await sleep(2000);
        console.info("[wifi_test] test start createGroup [promise]." + addConfig);
        expect(addConfig).assertTrue();
        await wifi.getCurrentGroup()
            .then((data)  => {
            console.info("[wifi_test] getCurrentGroup  [promise] result -> " + JSON.stringify(data));
            expect(true).assertEqual(data.length!=0);
            expect(true).assertEqual(data.goBand == WifiP2PConfig.goBand);
            console.info("[wifi_test] test start deletePersistentGroup");
            var removePConfig = wifi.deletePersistentGroup(data.networkId);
            console.info("[wifi_test] test start deletePersistentGroup" + removePConfig);
            expect(removePConfig).assertTrue();
            console.info("[wifi_test] test start removeGroup");
            var removeConfig = wifi.removeGroup();
            console.info("[wifi_test] test start removeGroup" + removeConfig);
            expect(removeConfig).assertTrue();
        });
        done();
    })

    /**
    * @tc.number     config_0004
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0004
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pConnect infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0004', 0,  async function(done) {
        var WifiP2PConfig3 = {
            deviceAddress : "02:11:65:f2:0d:6e",
            netId : -2,
            passphrase : "12345678",
            groupName : "AAAZZZ",
            goBand : 0
        };
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if(!active){
            var enable = wifi.enableWifi();
            await sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
        console.info("[wifi_test] test start startDiscoverDevices.");
        var scanConfig = wifi.startDiscoverDevices();
        await sleep(2000);
        console.info("[wifi_test] test startDiscoverDevices result." + scanConfig);
        expect(scanConfig).assertTrue();
        console.info("[wifi_test] test start p2pConnect.");
        var connConfig = wifi.p2pConnect(WifiP2PConfig3);
        console.info("[wifi_test] test p2pConnect result." + connConfig);
        expect(connConfig).assertTrue();
        console.info("[wifi_test] test start stopDiscoverDevices.");
        var stopScan = wifi.stopDiscoverDevices();
        console.info("[wifi_test] test stopDiscoverDevices result." + stopScan);
        done()
    })

    /**
    * @tc.number     config_0005
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0005
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test getP2pLinkedInfo infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0005', 0, async function(done) {
        var P2pConnectState = {
            DISCONNECTED :0,
            CONNECTED : 1,
        };
        await wifi.getP2pLinkedInfo()
            .then((data)  => {
                console.info("[wifi_test] getP2pLinkedInfo  [promise] result -> " + JSON.stringify(data));
                expect(true).assertEqual(data.length!=0);
            }).catch((error) => {
                console.info("[wifi_test]getP2pLinkedInfo promise then error." + JSON.stringify(error));
                expect(error).assertFail();
         });
        wifi.getP2pLinkedInfo((err, result) => {
            if (err) {
                console.error('failed to getP2pLinkedInfo callback  ' + JSON.stringify(err));
                return;
            }
            console.info("[wifi_test] getP2pLinkedInfo [callback] -> " + JSON.stringify(result));
            console.info("connectState: " + result.connectState);
            console.info("isGroupOwner: " + result.isGroupOwner);
            console.info("groupOwnerAddr: " + result.groupOwnerAddr);
            expect(false).assertEqual(result.connectState ==P2pConnectState.CONNECTED);
            expect(false).assertEqual(result.connectState ==P2pConnectState.DISCONNECTED);

        });
        done();
    })

    /**
    * @tc.number     config_0006
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0006
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pCancelConnect infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0006', 0,  async function(done) {
        console.info("[wifi_test] test start p2pCancelConnect.");
        var disConn = wifi.p2pCancelConnect();
        await sleep(2000);
        console.info("[wifi_test] test p2pCancelConnect result." + disConn);
        expect(disConn).assertTrue();
        console.info("[wifi_test] test start removeGroup");
        var removeConfig = wifi.removeGroup();
        console.info("[wifi_test] test start removeGroup" + removeConfig);
        expect(removeConfig).assertTrue();
        done();
    })

    /**
    * @tc.number     config_0007
    * @tc.name       SUB_Communication_WiFi_P2P_Config_0007
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test getP2pPeerDevices infos
    */
    it('SUB_Communication_WiFi_P2P_Config_0007', 0,  async function(done)  {
        var P2pDeviceStatus = {
            CONNECTED : 0,
            INVITED : 1,
            FAILED : 2,
            AVAILABLE : 3,
            UNAVAILABLE : 4,
        };
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if(!active){
            var enable = wifi.enableWifi();
            await sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
        console.info("[wifi_test] test start startDiscoverDevices.");
        var scanConfig = wifi.startDiscoverDevices();
        await sleep(2000);
        console.info("[wifi_test] test startDiscoverDevices result." + scanConfig);
        expect(scanConfig).assertTrue();
        await wifi.getP2pPeerDevices()
            .then((data)  => {
            console.info("[wifi_test] getP2pPeerDevices  [promise] result -> " + JSON.stringify(data));
            expect(true).assertEqual(data.length!=0);
        }).catch((error) => {
            console.info("[wifi_test]getP2pPeerDevices promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
        wifi.getP2pPeerDevices((err, result) => {
            if (err) {
                console.error('failed to getP2pPeerDevices infos callback because ' + JSON.stringify(err));
                return;
            }
            console.info("[wifi_test] getP2pPeerDevices [callback] -> " + JSON.stringify(result));
            var len = Object.keys(result).length;
            for (var j = 0; j < len; ++j) {
                console.info("deviceName: " + result[j].deviceName);
                console.info("deviceAddress: " + result[j].deviceAddress);
                console.info("primaryDeviceType: " + result[j].primaryDeviceType);
                console.info("deviceStatus: " + result[j].deviceStatus);
                console.info("groupCapabilitys: " + result[j].groupCapabilitys);
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
            console.info("[wifi_test] test stopDiscoverDevices.");
            var stopScan = wifi.stopDiscoverDevices();
            console.info("[wifi_test] test stopDiscoverDevices result." + stopScan);
            expect(stopScan).assertTrue();
            done();
        });

    })

    /**
    * @tc.number     p2pStateChange_0001
    * @tc.name       SUB_Communication_WiFi_P2P_P2pStateChange_0001
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pStateChange callback
    */
    it('SUB_Communication_WiFi_P2P_P2pStateChange_0001', 0, async function (done) {
        console.info('[wifi_test] OnP2pStateChange test start ...');
        await wifi.on('p2pStateChange', result => {
            console.info("onP2pStateChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offP2pStateChange test start ...');
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
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pConnectionChange callback
    */
    it('SUB_Communication_WiFi_P2P_p2pConnectionChange_0002', 0, async function (done) {
        console.info('[wifi_test] p2pConnectionChange test start ...');
        var recvP2pConnectionChangeFunc = result => {
            console.info("wifi_test / p2p connection change receive event: " + JSON.stringify(result));

            wifi.getP2pLinkedInfo((err, data) => {
                if (err) {
                    console.error('wifi_test / failed to get getP2pLinkedInfo: ' + JSON.stringify(err));
                    return;
                }
                console.info("wifi_test / get getP2pLinkedInfo [callback] -> " + JSON.stringify(data));
            });
            wifi.getCurrentGroup((err, data) => {
                if (err) {
                    console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                    return;
                }
                console.info("wifi_test / get getCurrentGroup [callback] -> " + JSON.stringify(data));
            });
        };
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
    * @tc.number     p2pDeviceChange_0003
    * @tc.name       SUB_Communication_WiFi_P2P_p2pDeviceChange_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pDeviceChange callback
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
    * @tc.number     p2pPeerDeviceChange_0004
    * @tc.name       SUB_Communication_WiFi_P2P_p2pPeerDeviceChange_0004
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pPeerDeviceChange callback
    */
    it('SUB_Communication_WiFi_P2P_p2pPeerDeviceChange_0004', 0, async function (done) {
        console.info('[wifi_test] Onp2pDeviceChange test start ...');
        var recvP2pPeerDeviceChangeFunc = result => {
            console.info("wifi_test / p2p peer device change receive event: " + JSON.stringify(result));
            wifi.getP2pDevices((err, data) => {
                if (err) {
                    console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                    return;
                }
                console.info("wifi_test / getP2pDevices [callback] -> " + JSON.stringify(data));
                var len = Object.keys(data).length;
                console.log("getP2pDevices number: " + len);
                for (var i = 0; i < len; ++i) {
                    if (data[i].deviceName === "GRE") {
                        console.info("wifi_test / p2pConnect: -> " + data[i].deviceAddress);
                        var config = {
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
            console.info('[wifi_test] offP2pPeerDeviceChange test start ...');
            wifi.off('p2pPeerDeviceChange', result => {
                console.info("offP2pPeerDeviceChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 1 * 1000);
        done();
    })

    /**
    * @tc.number     p2pPersistentGroupChange_0005
    * @tc.name       SUB_Communication_WiFi_P2P_p2pPersistentGroupChange_0005
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pPersistentGroupChange callback
    */
    it('SUB_Communication_WiFi_P2P_p2pPersistentGroupChange_0005', 0, async function (done) {
        console.info('[wifi_test] OnP2pPersistentGroupChange test start ...');
        var recvP2pPersistentGroupChangeFunc = result => {
            console.info("wifi_test / p2p persistent group change receive event" + JSON.stringify(result));
            var config = {
                "deviceAddress" : "02:11:65:f2:0d:6e",
                "netId":-2,
                "passphrase":"",
                "groupName":"",
                "goBand":0,
            };
            console.info("[wifi_test] test start createGroup .");
            var addConfig = wifi.createGroup(config);
            console.info("[wifi_test] test start createGroup result." + addConfig);
            expect(addConfig).assertTrue();
            wifi.getCurrentGroup((err, data) => {
                if (err) {
                    console.error('wifi_test / failed to get getCurrentGroup: ' + JSON.stringify(err));
                    return;
                }
                console.info("wifi_test / get getCurrentGroup [callback] -> " + JSON.stringify(data));
            });
        };
        await wifi.on('p2pPersistentGroupChange', result => {
            console.info("p2pPersistentGroupChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offP2pPersistentGroupChange test start ...');
            wifi.off('p2pPersistentGroupChange', result => {
                console.info("offP2pPersistentGroupChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 1 * 1000);
        done();
    })

    /**
    * @tc.number     p2pDiscoveryChange_0006
    * @tc.name       SUB_Communication_WiFi_P2P_p2pDiscoveryChange_0006
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test p2pDiscoveryChange callback
    */
    it('SUB_Communication_WiFi_P2P_p2pDiscoveryChange_0006', 0, async function (done) {
        console.info('[wifi_test] Onp2pDiscoveryChange test start ...');
        await wifi.on('p2pDiscoveryChange', result => {
            console.info("onp2pDiscoveryChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offp2pDiscoveryChange test start ...');
            wifi.off('p2pDiscoveryChange', result => {
                console.info("offp2pDiscoveryChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 1 * 1000);
        done();
    })

    console.log("*************[wifi_test] start wifi js unit test end*************");
})


