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

import wifiext from '@ohos.wifiext'

import wifiManagerExt from '@ohos.wifiManagerExt'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifi.isWifiActive());
}
function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

let wifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_OPEN: 1,
    WIFI_SEC_TYPE_WEP: 2,
    WIFI_SEC_TYPE_PSK: 3,
    WIFI_SEC_TYPE_SAE: 4,
}

let PowerModel = {
    SLEEPING : 0,
    GENERAL : 1,
    THROUGH_WALL : 2,
}

let connState = {
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
    "securityType": wifiSecurityType.WIFI_SEC_TYPE_PSK
}

let wifiChannelWidth = {
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
        * @tc.name testWifiStateChange
        * @tc.desc Test wifiStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0001', 0, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiState, wifiStateChangeCallback);
            await sleep(3000);
            wifi.off(wifiState, wifiStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0002
        * @tc.name testWifiConnectionChange
        * @tc.desc Test wifiConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0002', 0, async function (done) {
            let wifiConnectionState = "wifiConnectionChange";
            let wifiConnectionChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiConnectionState, wifiConnectionChangeCallback);
            await sleep(3000);
            wifi.off(wifiConnectionState, wifiConnectionChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0003
        * @tc.name testWifiScanStateChange
        * @tc.desc Test wifiScanStateChange  callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0003', 0, async function (done) {
            let wifiScanState = "wifiScanStateChange";
            let wifiScanStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiScanState, wifiScanStateChangeCallback);
            let scanResult = wifi.scan();
            await sleep(3000);
            wifi.off(wifiScanState, wifiScanStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0004
        * @tc.name testWifiRssiChange
        * @tc.desc Test wifiRssiChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0004', 0, async function (done) {
            let wifiRssiState = "wifiRssiChange";
            let wifiRssiChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiRssiState, wifiRssiChangeCallback);
            await sleep(3000);
            wifi.off(wifiRssiState, wifiRssiChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0005
        * @tc.name testHotspotStateChange
        * @tc.desc Test hotspotStateChange api.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0005', 0, async function (done) {
            let hotspotState = "hotspotStateChange";
            let hotspotStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(hotspotState, hotspotStateChangeCallback);
            await sleep(3000);
            wifi.off(hotspotState, hotspotStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0001
        * @tc.name testenableHotspot
        * @tc.desc Test enableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0001', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] enableHotspot: " + wifiext.enableHotspot())
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0002
        * @tc.name testdisableHotspot
        * @tc.desc Test disableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0002', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] disableHotspot: " + wifiext.disableHotspot())
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0003
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0003', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                await wifiext.getSupportedPowerModel()
                    .then(data => {
                        console.info("[wifi_test]getSupportedPowerModel promise result -> " + JSON.stringify(data));
                    });
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0004
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0004', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                function getSupportedPowerModelResult(){
                    return new Promise((resolve, reject) => {
                        wifiext.getSupportedPowerModel(
                            (err, result) => {
                                if(err) {
                                    console.info("[wifi_test]failed to  getSupportedPowerModel:" + JSON.stringify(err));
                                    expect(true).assertTrue();
                                }
                                console.info("[wifi_test]getSupportedPowerModel callback:" + JSON.stringify(result));
                                resolve();
                            });
                    });
                }
                await getSupportedPowerModelResult();
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0005
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0005', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                await wifiext.getPowerModel()
                    .then(data => {
                        console.info("[wifi_test]getPowerModel promise result -> " + JSON.stringify(data));
                    });
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0006
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0006', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                function getPowerModelResult(){
                    return new Promise((resolve, reject) => {
                        wifiext.getPowerModel(
                            (err, result) => {
                                if(err) {
                                    console.info("[wifi_test]failed to  getPowerModel:" + JSON.stringify(err));
                                    expect(true).assertTrue();
                                }
                                console.info("[wifi_test]getPowerModel callback:" + JSON.stringify(result));
                                resolve();
                            });
                    });
                }
                await getPowerModelResult();
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0007
        * @tc.name testsetPowerModel
        * @tc.desc Test setPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0007', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0007 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0007 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] setPowerModel: " + wifiext.setPowerModel(PowerModel))
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0007 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0007 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0008
        * @tc.name testenableHotspot
        * @tc.desc Test enableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0008', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0008 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0008 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] enableHotspot: " + wifiManagerExt.enableHotspot())
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0008 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0008 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0009
        * @tc.name testdisableHotspot
        * @tc.desc Test disableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0009', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0009 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0009 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] disableHotspot: " + wifiManagerExt.disableHotspot())
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0009 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0009 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0010
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0010', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                await wifiManagerExt.getSupportedPowerModel()
                    .then(data => {
                        console.info("[wifi_test]getSupportedPowerModel promise result -> " + JSON.stringify(data));
                    });
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0011
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0011', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                function getSupportedPowerModelResult(){
                    return new Promise((resolve, reject) => {
                        wifiManagerExt.getSupportedPowerModel(
                            (err, result) => {
                                if(err) {
                                    console.info("[wifi_test]failed to  getSupportedPowerModel:" + JSON.stringify(err));
                                    expect(true).assertTrue();
                                }
                                console.info("[wifi_test]getSupportedPowerModel callback:" + JSON.stringify(result));
                                resolve();
                            });
                    });
                }
                await getSupportedPowerModelResult();
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0012
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0012', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                await wifiManagerExt.getPowerModel()
                    .then(data => {
                        console.info("[wifi_test]getPowerModel promise result -> " + JSON.stringify(data));
                    });
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0013
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0013', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                function getPowerModelResult(){
                    return new Promise((resolve, reject) => {
                        wifiManagerExt.getPowerModel(
                            (err, result) => {
                                if(err) {
                                    console.info("[wifi_test]failed to  getPowerModel:" + JSON.stringify(err));
                                    expect(true).assertTrue();
                                }
                                console.info("[wifi_test]getPowerModel callback:" + JSON.stringify(result));
                                resolve();
                            });
                    });
                }
                await getPowerModelResult();
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0007
        * @tc.name testsetPowerModel
        * @tc.desc Test setPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0014', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    ret = true;
                }
                console.info("[wifi_test] setPowerModel: " + wifiManagerExt.setPowerModel(PowerModel))
                expect(isAccessToken).assertFalse();
                done();
            } catch (e) {
                expect(ret).assertFalse();
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 end');
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
        })
}


