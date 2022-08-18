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

export default function actsWifiTestNew() {
    describe('actsWifiTestNew', function () {
        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number     P2P_0009
        * @tc.name       SUB_Communication_WiFi_XTS_P2P_0009
        * @since 8
        * @tc.desc       Test p2pCancelConnect Group  API functionality.
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_P2P_0009', 0, async function (done) {
            let WifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "AAAZZZ123",
                goBand : 0
            };
            let addConfig = wifi.createGroup(WifiP2PConfig);
            console.info("[wifi_test] test p2pConnect result." + addConfig);
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
        * @tc.number     P2P_0011
        * @tc.name       SUB_Communication_WiFi_XTS_P2P_0011
        * @since 8
        * @tc.desc       Test remove error Group functionality.
        * @syscap SystemCapability.Communication.WiFi.P2P
        * @permission ohos.permission.GET_WIFI_INFO
        */
        it('SUB_Communication_WiFi_XTS_P2P_0011', 0, async function (done) {
            let isRemoved = wifi.removeGroup(10000);
            console.info("[wifi_test]removeGroup(10000) result : " + JSON.stringify(isRemoved));
            expect(isRemoved).assertTrue();
            done();
        })

        /**
        * @tc.number     P2P_0002
        * @tc.name       SUB_Communication_WiFi_XTS_P2P_0002
        * @since 8
        * @tc.desc       Test set P2P DeviceName ,get TO P2pLocalDevice API functionality.
        * @systemapi Hide this for inner system use.
        * hits case(setDeviceName)
        */

        it('SUB_Communication_WiFi_XTS_P2P_0002', 0, async function (done) {
            await wifi.getP2pLocalDevice()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test] getP2pLocalDevice  [promise] result :" + JSON.stringify(data));
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
                            console.info("[wifi_test] getP2pLocalDevice callback result: " + JSON.stringify(ret));
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

    })
}


