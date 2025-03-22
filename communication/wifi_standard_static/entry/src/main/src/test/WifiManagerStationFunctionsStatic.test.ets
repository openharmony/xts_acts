/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function actsWifiManagerFunctionsTest() {

    describe("actsWifiManagerFunctionsTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.openWifi();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        /*
         * @tc.number: constantTest
         * @tc.name: constantTest
         * @tc.desc: Test constantTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("constantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let WIFI_SEC_TYPE_OPEN: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_OPEN:" + WIFI_SEC_TYPE_OPEN);
                expect(true).assertEqual(WIFI_SEC_TYPE_OPEN == 1);
                let WIFI_SEC_TYPE_SAE: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_SAE:" + WIFI_SEC_TYPE_SAE);
                expect(true).assertEqual(WIFI_SEC_TYPE_SAE == 4);
                let WIFI_SEC_TYPE_PSK: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_PSK:" + WIFI_SEC_TYPE_PSK);
                expect(true).assertEqual(WIFI_SEC_TYPE_PSK == 3);
                let DEVICE_CONNECTED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.CONNECTED;
                hilog.info(domain, tag, "DEVICE_CONNECTED:" + DEVICE_CONNECTED);
                expect(true).assertEqual(DEVICE_CONNECTED == 0);
                let P2PCONN_CONNECTED: wifiManager.P2pConnectState = wifiManager.P2pConnectState.CONNECTED;
                hilog.info(domain, tag, "P2PCONN_CONNECTED:" + P2PCONN_CONNECTED);
                expect(true).assertEqual(P2PCONN_CONNECTED == 1);
                let CONN_CONNECTED: wifiManager.ConnState = wifiManager.ConnState.CONNECTED;
                hilog.info(domain, tag, "CONN_CONNECTED:" + CONN_CONNECTED);
                expect(true).assertEqual(CONN_CONNECTED == 4);
                let WIFI6: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6;
                hilog.info(domain, tag, "WIFI6:" + WIFI6);
                expect(true).assertEqual(WIFI6 == 2);
                let WIFI6_PLUS: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6_PLUS;
                hilog.info(domain, tag, "WIFI6_PLUS:" + WIFI6_PLUS);
                expect(true).assertEqual(WIFI6_PLUS == 3);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "constant get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: wifiOnOffStateTest
         * @tc.name: wifiOnOffStateTest
         * @tc.desc: Test wifiOnOffStateTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("wifiOnOffStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                wifiManager.disableWifi();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try{
                let state = wifiManager.isWifiActive();
                hilog.info(domain, tag, "isWifiActive:" + state);
                expect(state).assertFalse();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                wifiManager.enableWifi();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try {
                let states = wifiManager.isWifiActive();
                hilog.info(domain, tag, "isWifiActive:" + states);
                expect(states).assertTrue();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: isConnectedTest
         * @tc.name: isConnectedTest
         * @tc.desc: Test isConnectedTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("isConnectedTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let state: boolean = wifiManager.isConnected();
                hilog.info(domain, tag, "isConnected:" + state);
                expect(state).assertFalse();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getIpInfoTest
         * @tc.name: getIpInfoTest
         * @tc.desc: Test getIpInfoTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getIpInfoTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.IpInfo = wifiManager.getIpInfo();
                hilog.info(domain, tag, "getIpInfo:" + JSON.stringify(info));
                expect(true).assertEqual(info != null);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getScanInfoListTest
         * @tc.name: getScanInfoListTest
         * @tc.desc: Test getScanInfoListTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getScanInfoListTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let infos: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
                if (infos != null) {
                    hilog.info(domain, tag, "bssid:" + infos[0]?.bssid);
                    hilog.info(domain, tag, "securityType:" + infos[0]?.securityType);
                    hilog.info(domain, tag, "rssi:" + infos[0]?.rssi);
                    hilog.info(domain, tag, "ssid:" + infos[0]?.ssid);
                    hilog.info(domain, tag, "band:" + infos[0]?.band);
                    hilog.info(domain, tag, "supportedWifiCategory:" + infos[0].supportedWifiCategory);
                    expect(true).assertEqual(infos != null);
                } else {
                    expect().assertFail();
                }
            }catch(err: BusinessError){
                hilog.info(domain, tag, "getScanInfoList get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: isMeteredHotspotTest
         * @tc.name: isMeteredHotspotTest
         * @tc.desc: Test isMeteredHotspotTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("isMeteredHotspotTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered: boolean = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot:" + JSON.stringify(metered));
                expect(metered).assertFalse();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "isMeteredHotspot get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2501000);
                }
            }
            done();
        })

        /*
         * @tc.number: getIpv6InfoTest
         * @tc.name: getIpv6InfoTest
         * @tc.desc: Test getIpv6InfoTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getIpv6InfoTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
                hilog.info(domain, tag, "getIpv6Info:" + JSON.stringify(info));
                expect(true).assertEqual(info != null);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpv6Info get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getSignalLevelTest
         * @tc.name: getSignalLevelTest
         * @tc.desc: Test getSignalLevelTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getSignalLevelTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let level: number = wifiManager.getSignalLevel(0 ,0);
                hilog.info(domain, tag, 'getSignalLevel success result:' + level);
                expect(true).assertEqual(level >= 0 && level <= 4);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getLinkedInfoPromiseTest
         * @tc.name: getLinkedInfoPromiseTest
         * @tc.desc: Test getLinkedInfoPromiseTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getLinkedInfoPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {
                    hilog.info(domain, tag, 'getLinkedInfo promise success result:' + JSON.stringify(data));
                    hilog.info(domain, tag, 'getLinkedInfo promise success result rssi:' + data.rssi);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result ssid:' + data.ssid);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result bssid:' + data.bssid);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result connState:' + data.connState);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result macAddress:' + data.macAddress);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result band:' + data.band);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result supportedWifiCategory:' + data.supportedWifiCategory);
                    expect(true).assertEqual(data != null);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getLinkedInfoCallbackTest
         * @tc.name: getLinkedInfoCallbackTest
         * @tc.desc: Test getLinkedInfoCallbackTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getLinkedInfoCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code == 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code == 801);
                            done();
                        } else {
                            expect().assertFail();
                            done();
                        }
                    } else {
                        if (data != null) {
                            hilog.info(domain, tag, 'getLinkedInfo callback success result:' + JSON.stringify(data));
                            hilog.info(domain, tag, 'getLinkedInfo callback success result rssi:' + data?.rssi);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result ssid:' + data?.ssid);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result bssid:' + data?.bssid);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result connState:' + data?.connState);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result macAddress:' + data?.macAddress);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result band:' + data?.band);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result supportedWifiCategory:' + data?.supportedWifiCategory);
                            done();
                        } else {
                            hilog.info(domain, tag, 'getLinkedInfo callback success result:' + JSON.stringify(data));
                            done();
                        }
                    }
                } catch (err :BusinessError) {
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            })
            done();
        })

        /*
         * @tc.number: getLinkedInfoSyncTest
         * @tc.name: getLinkedInfoSyncTest
         * @tc.desc: Test getLinkedInfoSyncTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getLinkedInfoSyncTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
                hilog.info(domain, tag, 'getLinkedInfoSync success result:' + JSON.stringify(infoSync));
                hilog.info(domain, tag, 'getLinkedInfoSync success result rssi:' + infoSync.rssi);
                hilog.info(domain, tag, 'getLinkedInfoSync success result ssid:' + infoSync.ssid);
                hilog.info(domain, tag, 'getLinkedInfoSync success result bssid:' + infoSync.bssid);
                hilog.info(domain, tag, 'getLinkedInfoSync success result connState:' + infoSync.connState);
                hilog.info(domain, tag, 'getLinkedInfoSync success result macAddress:' + infoSync.macAddress);
                hilog.info(domain, tag, 'getLinkedInfoSync success result band:' + infoSync.band);
                hilog.info(domain, tag, 'getLinkedInfoSync success result supportedWifiCategory:' + infoSync.supportedWifiCategory);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
    })
}