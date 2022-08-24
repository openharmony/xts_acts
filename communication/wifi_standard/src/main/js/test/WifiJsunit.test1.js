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

function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

let WifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_OPEN: 1,
    WIFI_SEC_TYPE_WEP: 2,
    WIFI_SEC_TYPE_PSK: 3,
    WIFI_SEC_TYPE_SAE: 4,
}

let ConnState = {
    SCANNING: 0,
    CONNECTING: 1,
    AUTHENTICATING: 2,
    OBTAINING_IPADDR: 3,
    CONNECTED: 4,
    DISCONNECTING: 5,
    DISCONNECTED: 6,
    UNKNOWN: 7,
}

let WifiChannelWidth = {
    WIDTH_20MHZ : 0,
    WIDTH_40MHZ : 1,
    WIDTH_80MHZ : 2,
    WIDTH_160MHZ : 3,
    WIDTH_80MHZ_PLUS : 4,
    WIDTH_INVALID:null,
}

export default function actsWifiTestNew() {
    describe('actsWifiTestNew', function () {
        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number     CandidateNetWork_0001
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_0001
        * @since 9
        * @tc.desc       Test add OPEN and WEP CandidateConfig Promise API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0001', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_OPEN",
                "bssid": "",
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_OPEN,
            };

            await wifi.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add OPEN CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_js] add OPEN CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect(false).assertFalse();
                });

            let getconfig = wifi.getCandidateConfigs();
            console.info("[wifi_test] wifi get OPEN CandidateConfigs result : " + JSON.stringify(getconfig));

            let wifiDeviceConfig1 = {
                "ssid": "TEST_WEP",
                "bssid": "",
                "preSharedKey": "ABCDEF1234",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_WEP,
            };

            await wifi.addCandidateConfig(wifiDeviceConfig1)
                .then(netWorkId => {
                    console.info("[wifi_test]add WEP CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_js] add WEP CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect(false).assertFalse();
                });
            console.info("[wifi_test] wifi get WEP CandidateConfigs result : " + JSON.stringify(getconfig));
            done();
        })

        /**
        * @tc.number     CandidateNetWork_0001
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_0002
        * @since 8
        * @tc.desc       Test add PSK CandidateConfig and removeCandidateConfig Promise API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0002', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_PSK",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "netId": "",
            };
            await wifi.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add PSK CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_js] add PSK CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getconfig = wifi.getCandidateConfigs();
            console.info("[wifi_test] wifi get PSK CandidateConfigs result : " + JSON.stringify(getconfig));
            expect(true).assertEqual(getconfig[0].securityType == wifiDeviceConfig.securityType);
            expect(true).assertEqual(getconfig[0].isHiddenSsid == wifiDeviceConfig.isHiddenSsid);
            expect(true).assertEqual(getconfig[0].ssid == wifiDeviceConfig.ssid);
            var networkId = getconfig[0].netId;
            console.info("[wifi_test] wifi get networkId result : " + JSON.stringify(networkId));
            await wifi.removeCandidateConfig(networkId)
                .then(ret => {
                    console.info("[wifi_test]remove CandidateConfig promise" + JSON.stringify(ret));
                    expect(false).assertFalse();
                    let getconfig1 = wifi.getCandidateConfigs();
                    console.info("[wifi_test] wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                    console.info("[wifi_test] wifi  getconfig.length result : " + JSON.stringify(getconfig1.length));
                    expect(true).assertEqual(getconfig1.length == 0);
                }).catch((error) => {
                    console.error('[wifi_js] remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })

        /**
        * @tc.number     CandidateNetWork_0003
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_0003
        * @since 8
        * @tc.desc       Test add SAE CandidateConfig Promise API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0003', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_SAE",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_SAE,
            };
            await wifi.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add SAE CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_js] add SAE CandidateConfig promise failed -> ' + JSON.stringify(error));
                });
            let getconfig = wifi.getCandidateConfigs();
            console.info("[wifi_test] wifi get SAE CandidateConfigs result : " + JSON.stringify(getconfig));
            done();
        })

        /**
        * @tc.number     CandidateNetWork_0005
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_0005
        * @since 8
        * @tc.desc       Test add CandidateConfig and removeCandidateConfig callback API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0005', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TYPE_PSK1",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            }

            function addCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.addCandidateConfig(wifiDeviceConfig,
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
            let configs = wifi.getCandidateConfigs();
            console.info("[wifi_test] wifi getCandidateConfigs result : " + JSON.stringify(configs));
            expect(true).assertEqual(configs[0].securityType == wifiDeviceConfig.securityType);
            expect(true).assertEqual(configs[0].isHiddenSsid == wifiDeviceConfig.isHiddenSsid);
            expect(true).assertEqual(configs[0].ssid == wifiDeviceConfig.ssid);
            var networkId = configs[0].netId;

            function removeCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.removeCandidateConfig(networkId,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]removeCandidate callback failed : " + JSON.stringify(err));
                                
                            }
                            console.info("[wifi_test] removeCandidateConfig callback result:" + JSON.stringify(ret));
                            expect(ret).assertTrue();
                            let configs1 = wifi.getCandidateConfigs();
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
        * @tc.number     CandidateNetWork_0006
        * @tc.name       SUB_Communication_WiFi_XTS_SUB_Communication_WiFi_XTS_CandidateNetWork_0006
        * @tc.desc       Test connect To CandidateConfig API functionality.
        * @since 9
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0006', 0, async function (done) {
            let WifiSecurityType = {
                WIFI_SEC_TYPE_INVALID: 0,
                WIFI_SEC_TYPE_OPEN: 1,
                WIFI_SEC_TYPE_WEP: 2,
                WIFI_SEC_TYPE_PSK: 3,
                WIFI_SEC_TYPE_SAE: 4,
            }
            let wifiDeviceConfig = {
                "ssid": "HONOR 3000",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            };
            await wifi.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_js] add CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getconfig = wifi.getCandidateConfigs();
            console.info("[wifi_test] wifi get  CandidateConfigs result : " + JSON.stringify(getconfig));
            let connectToCandidate = wifi.connectToCandidateConfig(getconfig[0].netId);
            console.info("[wifi_test] connect To CandidateConfig result : " + JSON.stringify(connectToCandidate));
            await sleep(3000);
            await wifi.getLinkedInfo()
                .then((result) => {
                    console.info("[wifi_test] get wifi link [promise] -> " + JSON.stringify(result));
                    expect(JSON.stringify(result)).assertContain('band');
                    done();
                }).catch((error) => {
                    console.info("[wifi_test] promise then error." + JSON.stringify(error));
                    expect().assertFail();
                });
            done();
        })


        /**
        * @tc.number     Sta_0002
        * @tc.name       SUB_Communication_WiFi_XTS_Sta_0002
        * @tc.desc       Test  get to ScanInfos promise and callback API functionality.
        * @since 6
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.GET_WIFI_INFO and (ohos.permission.GET_WIFI_PEERS_MAC or ohos.permission.LOCATION)
        */
        it('SUB_Communication_WiFi_XTS_Sta_0002', 0, async function (done) {
            await wifi.getScanInfos()
                .then(result => {
                    let clen = Object.keys(result).length;
                    expect(clen).assertLarger(0);
                    console.info("[wifi_test] getScanInfos promise result " + JSON.stringify(result));
                });

            function getScanInfos() {
                return new Promise((resolve, reject) => {
                    wifi.getScanInfos(
                        (err, result) => {
                            if (err) {
                                console.log("[wifi_test] wifi getScanInfos failed " + err);
                            }
                            let clen = Object.keys(result).length;
                            if (!(clen == 0)) {
                                expect(clen).assertLarger(0);
                                console.info("[wifi_test] getScanInfos callback result: " + JSON.stringify(result));
                                for (let j = 0; j < clen; ++j) {
                                    console.info("ssid: " + result[j].ssid + "bssid: " + result[j].bssid +
                                    "securityType: " + result[j].securityType +
                                    "rssi: " + result[j].rssi + "band: " + result[j].band +
                                    "frequency: " + result[j].frequency + "channelWidth: " + result[j].channelWidth +
                                    "timestamp" + result[j].timestamp + "capabilities" + result[j].capabilities
                                    + "centerFrequency0: " + result[j].centerFrequency0
                                    + "centerFrequency1: " + result[j].centerFrequency1
                                    + "infoElems: " + result[j].infoElems);
                                }
                            }
                            resolve();
                        });
                });
            }

            await getScanInfos();
            done();
        })

        /**
        * @tc.number     Sta_0034
        * @tc.name       SUB_Communication_WiFi_XTS_Sta_0034
        * @tc.desc       Test  get to ScanInfos  Sync API functionality.
        * @since 9
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.GET_WIFI_INFO and (ohos.permission.GET_WIFI_PEERS_MAC or ohos.permission.LOCATION)
        */
        it('SUB_Communication_WiFi_XTS_Sta_0034', 0, async function (done) {
            let getScanInfos = wifi.getScanInfosSync();
            console.info("[wifi_test] wifi get to ScanInfosSync  result : " + JSON.stringify(getScanInfos));
            let lenth = Object.keys(getScanInfos).length;
            console.info("[wifi_test] wifi ScanInfosSync length  result : " + JSON.stringify(lenth));
            expect(lenth).assertLarger(0);
            done();
        })

        /**
        * @tc.number     CandidateNetWork_0001
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_1
        * @since 8
        * @tc.desc       Test add UntrustedConfig and removeUntrustedConfig Promise API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_1', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_PSK",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "netId": "",
            };
            await wifi.addUntrustedConfig(wifiDeviceConfig)
                .then(ret => {
                    console.info("[wifi_test]addUntrustedConfig promise : " + JSON.stringify(ret));
                    expect(ret).assertTrue();
                }).catch((error) => {
                    console.error('[wifi_js]addUntrustedConfig promise failed -> ' + JSON.stringify(error));
                   
                });
            await wifi.removeUntrustedConfig(wifiDeviceConfig)
                .then(ret => {
                    console.info("[wifi_test]removeUntrustedConfig promise:" + JSON.stringify(ret));
                    expect(True).assertTrue();
                }).catch((error) => {
                    console.error('[wifi_js]removeUntrustedConfig promise failed -> ' + JSON.stringify(error));
                    
                });
            done();
        })

        /**
        * @tc.number     CandidateNetWork_0001
        * @tc.name       SUB_Communication_WiFi_XTS_CandidateNetWork_2
        * @since 8
        * @tc.desc       Test add UntrustedConfig and removeUntrustedConfig callback API functionality.
        * @syscap SystemCapability.Communication.WiFi.STA
        * @permission ohos.permission.SET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_2', 0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TYPE_PSK1",
                "bssid": "",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            }
            function addCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.addUntrustedConfig(wifiDeviceConfig,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]addUntrustedConfig callback failed : " + JSON.stringify(err));
                           
                            }
                            console.info("[wifi_test]addUntrustedConfig callback result: " + JSON.stringify(ret));
                            expect(ret).assertTrue();
                            resolve();
                        });
                });
            }
            await addCandidate();
            function removeCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.removeUntrustedConfig(wifiDeviceConfig,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]removeUntrustedConfig callback failed" + JSON.stringify(err));
                              
                            }
                            console.info("[wifi_test]removeUntrustedConfig callback result:" + JSON.stringify(ret));
                            expect(ret).assertTrue();
                            resolve();
                        });
                });
            }
            await removeCandidate();
            done();
        })
    })
}



