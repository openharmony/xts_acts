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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

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

let untrustedDeviceConfig = {
    "ssid": "untrusted_ssid",
    "bssid": "",
    "preSharedKey": "12345678",
    "isHiddenSsid": false,
    "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK
}

let WifiChannelWidth = {
    WIDTH_20MHZ : 0,
    WIDTH_40MHZ : 1,
    WIDTH_80MHZ : 2,
    WIDTH_160MHZ : 3,
    WIDTH_80MHZ_PLUS : 4,
    WIDTH_INVALID:null,
}

export default function actsWifiEventTest() {
    describe('actsWifiEventTest', function() {
        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0001
        * @tc.name testwifiStateChange
        * @tc.desc Test wifiStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0001', 0, async function (done) {
            wifi.on('wifiStateChange', async result => {
                console.info("wifiStateChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result != null);
                let promise = new Promise((resolve) => {
                    wifi.off('wifiStateChange', result => {
                        console.info("offwifiStateChange callback, result: " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve()
                    });
                })
                await promise.then(done)
            });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0002
        * @tc.name testwifiConnectionChange
        * @tc.desc Test wifiConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0002', 0, async function (done) {
            wifi.on('wifiConnectionChange', async result => {
                console.info("wifiConnectionChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result != null);
                let promise = new Promise((resolve) => {
                    console.info('[wifi_test] offwifiConnectionChange test start ...');
                    wifi.off('wifiConnectionChange', result => {
                        console.info("offwifiConnectionChange callback, result:  " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve()
                    });
                })
                await promise.then(done)
            });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0003
        * @tc.name testwifiScanStateChange
        * @tc.desc Test Test wifiScanStateChange  callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0003', 0, async function (done) {
            wifi.on('wifiScanStateChange', async result => {
                console.info("wifiScanStateChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result != null);
                let promise = new Promise((resolve) => {
                    console.info('[wifi_test] offwifiScanStateChange test start ...');
                    wifi.off('wifiScanStateChange', result => {
                        console.info("offwifiScanStateChange callback, result:  " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve()
                    });
                })
                await promise.then(done)
            });
            let scan = wifi.scan();
            await sleep(3000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0004
        * @tc.name testwifiRssiChange
        * @tc.desc Test wifiRssiChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0004', 0, async function (done) {
            wifi.on('wifiRssiChange', async result => {
                console.info("wifiRssiChange callback, result:" + JSON.stringify(result));
                expect(true).assertEqual(result != null);
                let promise = new Promise((resolve) => {
                    console.info('[wifi_test] offwifiRssiChange test start ...');
                    wifi.off('wifiRssiChange', result => {
                        console.info("offwifiRssiChange callback, result:  " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve()
                    });
                })
                await promise.then(done)
            });
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0005
        * @tc.name testhotspotStateChange
        * @tc.desc Test hotspotStateChange api.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0005', 0, async function (done) {
            console.info("[wifi_test]hotspotStateChange On test");
            try {
                await wifi.on('hotspotStateChange', (data) => {
                    console.info("[wifi_test] hotspotStateChange On ->" + data);
                    expect(true).assertEqual(data != null);
                });

            } catch (e) {
                expect(null).assertFail();
            }
            console.info("[wifi_test]hotspotStateChange Off test");
            try {
                await wifi.off('hotspotStateChange', (data) => {
                    console.info("[wifi_test] hotspotStateChange Off ->" + data);
                    expect(true).assertEqual(data != null);
                });
            } catch (e) {
                expect(null).assertFail();
            }
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
        })
}



