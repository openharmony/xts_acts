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

function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

let wifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_EAP: 5,
    WIFI_SEC_TYPE_EAP_SUITE_B: 6,
    WIFI_SEC_TYPE_OWE:7 ,
    WIFI_SEC_TYPE_WAPI_CERT:8 ,
    WIFI_SEC_TYPE_WAPI_PSK:9 ,
}

export default function actsWifiManagerCandidateNetWorkTest() {
    describe('actsWifiManagerCandidateNetWorkTest', function () {
        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0001
        * @tc.name testaddCandidateConfig
        * @tc.desc Test add OPEN and WEP CandidateConfig Promise API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0001', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_OPEN",
                "bssid": "",
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add OPEN CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_test]add OPEN CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect(true).assertEqual( (JSON.stringify(error)) !=null);
                });
            let getconfig = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get OPEN CandidateConfigs result : " + JSON.stringify(getconfig));
            let wifiDeviceConfig1 = {
                "ssid": "TEST_WEP",
                "bssid": "",
                "preSharedKey": "ABCDEF1234",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_WEP,
            };

            await wifiMg.addCandidateConfig(wifiDeviceConfig1)
                .then(netWorkId => {
                    console.info("[wifi_test]add WEP CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_test]add WEP CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect(true).assertEqual( (JSON.stringify(error)) !=null);
                });
            console.info("[wifi_test]wifi get WEP CandidateConfigs result : " + JSON.stringify(getconfig));
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0002
        * @tc.name testaddCandidateConfig
        * @tc.desc Test add PSK CandidateConfig and removeCandidateConfig Promise API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0002', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_PSK",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "netId": -1,
                "ipType": 1,
                "creatorUid": 7,
                "disableReason": 0,
                "randomMacType": 0,
                "randomMacAddr": "11:22:33:44:55:66",
                "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936},
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add PSK CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_test]add PSK CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get PSK CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            var networkId = getCandidateResult[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getCandidate = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getCandidate));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getCandidate.length));
                    expect(true).assertEqual(getCandidate.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed ： ' + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0003
        * @tc.name testaddCandidateConfig
        * @tc.desc Test add SAE CandidateConfig Promise API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0003', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_SAE",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_SAE,
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add SAE CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_js]add SAE CandidateConfig promise failed -> ' + JSON.stringify(error));
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get SAE CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            var networkId = getCandidateResult[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getconfig1 = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getconfig1.length));
                    expect(true).assertEqual(getconfig1.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0004
        * @tc.name testaddCandidateConfig
        * @tc.desc Test add MAX CandidateConfig and removeall CandidateConfig.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0004', 0, async function (done) {
            let SSID = "TYPE_PSK"
            for (let i = 0; i < 16; i++) {
                SSID = "TYPE_PSK" + i
                console.info("[wifi_test] get canshu result : ");
                let wifiDeviceConfig = {
                    "ssid": SSID,
                    "bssid": "",
                    "preSharedKey": "12345678",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                };
                console.info("[wifi_test]get wifiDeviceConfig ssid result : " + JSON.stringify(wifiDeviceConfig.ssid));
                await wifiMg.addCandidateConfig(wifiDeviceConfig)
                    .then(netWorkId => {
                        console.info("[wifi_test]add 16th CandidateConfig promise : " + JSON.stringify(netWorkId));
                        expect(true).assertEqual(netWorkId != -1);
                    }).catch((error) => {
                        console.error('[wifi_test]add 16th CandidateConfig promise failed ：' + JSON.stringify(error));
                        expect().assertFail();
                    });
            }
            let wifiDeviceConfig1 = {
                "ssid": "TYPE_17",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig1)
                .then(netWorkId => {
                    console.info("[wifi_test]add 17th CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error(`[wifi_test]add 17th failed, code is ${error.code}, message is ${error.message}`);
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get 16 CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            for (let i = 0; i < 16; i++) {
                var networkId = getCandidateResult[i].netId;
                console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
                await wifiMg.removeCandidateConfig(networkId)
                    .then(ret => {
                        let getconfig1 = wifiMg.getCandidateConfigs();
                        console.info("[wifi_test] wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                        console.info("[wifi_test] wifi getconfiglength result : " + JSON.stringify(getconfig1.length));
                    }).catch((error) => {
                        console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    });
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0005
        * @tc.name testaddCandidateConfig
        * @tc.desc Test add CandidateConfig and removeCandidateConfig callback API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0005', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_connect",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            }
            function addCandidate() {
                return new Promise((resolve, reject) => {
                    wifiMg.addCandidateConfig(wifiDeviceConfig,
                        (err, netWorkId) => {
                            if (err) {
                                console.info("[wifi_test]add CandidateConfig callback failed : " + JSON.stringify(err));
                            }
                            console.info("[wifi_test]addCandidateConfig callback result: " + JSON.stringify(netWorkId));
                            expect(true).assertEqual(netWorkId != -1);
                            resolve();
                        });
                });
            }
            await addCandidate();
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test] wifi getCandidateConfigs result : " + JSON.stringify(getCandidateResult));
            var networkId = getCandidateResult[0].netId;
            function removeCandidate() {
                return new Promise((resolve, reject) => {
                    wifiMg.removeCandidateConfig(networkId,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]removeCandidate callback failed : " + JSON.stringify(err));
                            }
                            let configs1 = wifiMg.getCandidateConfigs();
                            console.info("[wifi_test] wifi get  CandidateConfigs result : " + JSON.stringify(configs1));
                            console.info("[wifi_test] getconfig.length result : " + JSON.stringify(configs1.length));
                            expect(true).assertEqual(configs1.length == 0);
                            resolve();
                        });
                });
            }
            await removeCandidate();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0006
        * @tc.name testaddCandidateConfig
        * @tc.desc Test connect To CandidateConfig API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0006', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "HONOR 3000",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_test]add CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get  CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            let connectToCandidateResult = wifiMg.connectToCandidateConfig(getCandidateResult[0].netId);
            await sleep(3000);
            await wifiMg.getLinkedInfo()
                .then((result) => {
                    console.info("[wifi_test]get wifi link [promise] -> " + JSON.stringify(result));
                    done();
                }).catch((error) => {
                    console.info("[wifi_test]promise then error." + JSON.stringify(error));
                    expect().assertFail();
                });
            let getCandidateResult1 = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get CandidateConfigs result1 : " + JSON.stringify(getCandidateResult1));
            var networkId = getCandidateResult1[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getconfig1 = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getconfig1.length));
                    expect(true).assertEqual(getconfig1.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })
    })
}


