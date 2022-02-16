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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

import wifi from '@ohos.wifi'

// delay x ms
function sleep(delay) {
    var start = (new Date()).getTime();
    while(true){
        if((new Date()).getTime() - start > delay) {
            break;
        }
    }
}

var WifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_OPEN: 1,
    WIFI_SEC_TYPE_WEP: 2,
    WIFI_SEC_TYPE_PSK: 3,
    WIFI_SEC_TYPE_SAE: 4,
}

var wifiDeviceConfig = {
    "ssid": "TEST",
    "bssid": "A1:B1:C1:D1:E1:F1",
    "preSharedKey": "12345678",
    "isHiddenSsid": false,
    "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
}

var ipConfig = {
    "ipAddress": 1284752956,
    "gateway": 17017024,
    "dnsServers": 12345678,
    "domains": ["aaa"],
}

describe('ACTS_WifiTest', function() {
    beforeEach(function() {})

    afterEach(function() {})

    /**
     * @tc.number     open_0001
     * @tc.name       SUB_Communication_WiFi_Sta_Open_0001
     * @tc.desc       Test wifi.isWifiEnable API functionality.
     */
    it('SUB_Communication_WiFi_Sta_Open_0001', 0, function() {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Open_0001]");
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if (!active) {
            var enable = wifi.enableWifi();
            sleep(3000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.info("[wifi_test] close wifi test start.");
        var disable = wifi.disableWifi();
        sleep(3000);
        console.log("[wifi_test] wifi close result: " + disable);
        expect(disable).assertTrue();
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertFalse();
    })

    /**
     * @tc.number     Scan_0001
     * @tc.name       SUB_Communication_WiFi_Sta_Scan_0001
     * @tc.desc       Test get ScanInfos callback API functionality.
     */
    it('SUB_Communication_WiFi_Sta_Scan_0001', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Scan_0001]");
        var active1 = wifi.isWifiActive();
        if (!active1) {
            var enable = wifi.enableWifi();
            sleep(5000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        var scan = wifi.scan();
        sleep(3000);
        console.log("[wifi_test] open wifi scan result: " + scan);
        expect(scan).assertTrue();

        console.info("[wifi_test] Wifi getScanInfos promise test[1].");
        await wifi.getScanInfos()
            .then(result => {
                var clen = Object.keys(result).length;
                console.log("[wifi_test] wifi getScanInfos promise result length: " + clen);
                expect(clen).assertLarger(0);
                console.info("[wifi_test] getScanInfos promise result " + JSON.stringify(result));
            });

        console.info("[wifi_test] Wifi getScanInfos callback test[2].");
        wifi.getScanInfos(
            (err,result) => {
                if(err) {
                    console.log("[wifi_test] wifi getScanInfos failed " + err);
                }
                var clen = Object.keys(result).length;
                console.log("[wifi_test] wifi getScanInfos callback result length: " + clen);
                if (!(clen == 0 && i < 3)) {
                    expect(clen).assertLarger(0);
                    console.info("[wifi_test] getScanInfos callback result: " + JSON.stringify(result));
                    for (var j = 0; j < clen; ++j) {
                        console.info("ssid: " + result[j].ssid);
                        console.info("bssid: " + result[j].bssid);
                        console.info("securityType: " + result[j].securityType);
                        console.info("rssi: " + result[j].rssi);
                        console.info("band: " + result[j].band);
                        console.info("frequency: " + result[j].frequency);
                        console.info("timestamp: " + result[j].timestamp);
                        console.info("capabilities: " + result[j].capabilities);
                        console.info("channelWidth: " + result[j].channelWidth);
                    }
                }
                done()
            });
    })

    /**
     * @tc.number     Scan_0004
     * @tc.name       SUB_Communication_WiFi_Sta_Scan_0004
     * @tc.desc       Test wifi.getSignalLevel API functionality.
     */
    it('SUB_Communication_WiFi_Sta_Scan_0004', 0, function() {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Scan_0004]");
        console.info("[wifi_test] check the 2.4G rssi assgined to level test.");
        expect(wifi.getSignalLevel(-65, 1)).assertEqual(4);

        expect(wifi.getSignalLevel(-66, 1)).assertEqual(3);
        expect(wifi.getSignalLevel(-75, 1)).assertEqual(3);

        expect(wifi.getSignalLevel(-76, 1)).assertEqual(2);
        expect(wifi.getSignalLevel(-82, 1)).assertEqual(2);

        expect(wifi.getSignalLevel(-83, 1)).assertEqual(1);
        expect(wifi.getSignalLevel(-88, 1)).assertEqual(1);

        expect(wifi.getSignalLevel(-89, 1)).assertEqual(0);
        expect(wifi.getSignalLevel(-127, 1)).assertEqual(0);

        console.info("[wifi_test] check the 5G rssi assgined to level test.");
        expect(wifi.getSignalLevel(-65, 2)).assertEqual(4);

        expect(wifi.getSignalLevel(-66, 2)).assertEqual(3);
        expect(wifi.getSignalLevel(-72, 2)).assertEqual(3);

        expect(wifi.getSignalLevel(-73, 2)).assertEqual(2);
        expect(wifi.getSignalLevel(-79, 2)).assertEqual(2);

        expect(wifi.getSignalLevel(-80, 2)).assertEqual(1);
        expect(wifi.getSignalLevel(-85, 2)).assertEqual(1);

        expect(wifi.getSignalLevel(-86, 2)).assertEqual(0);
        expect(wifi.getSignalLevel(-127, 2)).assertEqual(0);
    })

    /**
     * @tc.number     Config_0001
     * @tc.name       SUB_Communication_WiFi_Sta_Config_0001
     * @tc.desc       Test create a OPEN SecurityType wifi device config
     */
    it('SUB_Communication_WiFi_Sta_Config_0001', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Config_0001]");
        console.info("[wifi_test] create a OPEN SecurityType wifi device config start.");
        var wifiDeviceConfig1 = {
            "ssid": "TEST_OPEN",
            "bssid": "",
            "preSharedKey": "",
            "isHiddenSsid": false,
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_OPEN,
        };

        await wifi.addDeviceConfig(wifiDeviceConfig1)
            .then(netWorkId => {
                console.info("[wifi_test]add OPEN Deviceconfig promise : " + JSON.stringify(netWorkId));
                expect(true).assertEqual(netWorkId != -1);
                console.info("[wifi_test] check add device configs successfully ");
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test] wifi getDeviceConfigs result1 : " + JSON.stringify(configs));
                expect(true).assertEqual(configs[0].securityType == wifiDeviceConfig1.securityType);
                expect(true).assertEqual(configs[0].isHiddenSsid == wifiDeviceConfig1.isHiddenSsid);
                expect(true).assertEqual(configs[0].ssid == wifiDeviceConfig1.ssid);
            });

        wifi.addDeviceConfig(wifiDeviceConfig1,
            (err, netWorkId) => {
                if(err) {
                    console.info("[wifi_test]add OPEN callback failed : " + JSON.stringify(err));
                    return;
                 }
                console.info("[wifi_test]add OPEN Deviceconfig callback : " + JSON.stringify(netWorkId));
                expect(true).assertEqual(netWorkId != -1);
                console.info("[wifi_test] check add device configs successfully ");
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test] wifi getDeviceConfigs result2 : " + JSON.stringify(configs));
                expect(true).assertEqual(configs[0].securityType == wifiDeviceConfig1.securityType);
                expect(true).assertEqual(configs[0].isHiddenSsid == wifiDeviceConfig1.isHiddenSsid);
                expect(true).assertEqual(configs[0].ssid == wifiDeviceConfig1.ssid);

                console.info("[wifi_test] remove config");
                var isRemoved = wifi.removeAllNetwork();
                console.info("[wifi_test] check remove configs successfully,result:" + isRemoved);
                expect(isRemoved).assertTrue();
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test]remove config,current get Config : " + JSON.stringify(configs));
                expect(true).assertEqual(configs.length == 0);
                done()
            });
    })

    /**
     * @tc.number     Config_0002
     * @tc.name       SUB_Communication_WiFi_Sta_Config_0002
     * @tc.desc       Test create a PSK SecurityType wifi device config
     */
    it('SUB_Communication_WiFi_Sta_Config_0002', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Config_0002]");
        console.info("[wifi_test] create a PSK SecurityType wifi device config start.");
        var wifiDeviceConfig1 = {
            "ssid": "TEST_PSK",
            "bssid": "",
            "preSharedKey": "12345678",
            "isHiddenSsid": false,
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };

        await wifi.addDeviceConfig(wifiDeviceConfig1)
            .then(netWorkId => {
                console.info("[wifi_test]add PSK Deviceconfig promise : " + JSON.stringify(netWorkId));
                expect(true).assertEqual(netWorkId != -1);
                console.info("[wifi_test] check add device configs successfully ");
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test] wifi getDeviceConfigs result1 : " + JSON.stringify(configs));
                expect(true).assertEqual(configs[0].securityType == wifiDeviceConfig1.securityType);
                expect(true).assertEqual(configs[0].isHiddenSsid == wifiDeviceConfig1.isHiddenSsid);
                expect(true).assertEqual(configs[0].preSharedKey == wifiDeviceConfig1.preSharedKey);
                expect(true).assertEqual(configs[0].ssid == wifiDeviceConfig1.ssid);

                console.info("[wifi_test] remove config");
                var isRemoved = wifi.removeDevice(netWorkId);
                console.info("[wifi_test] check remove config successfully,result:" + isRemoved);
                expect(isRemoved).assertTrue();
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test]remove config,current getConfig: " + JSON.stringify(configs));
                expect(true).assertEqual(configs.length == 0);
            });
        done()
    })

    /**
     * @tc.number     Config_0005
     * @tc.name       SUB_Communication_WiFi_Sta_Config_0005
     * @tc.desc       Test remove all wifi device config
     */
    it('SUB_Communication_WiFi_Sta_Config_0005', 0, async function(done) {
        console.info("[wifi_test] create multiple valid wifi device config and add it.");
        var wifiDeviceConfig1 = {
            "ssid": "TESTWgr1",
            "bssid": "",
            "preSharedKey": "12345678",
            "isHiddenSsid": "false",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        var wifiDeviceConfig2 = {
            "ssid": "TESTWgr2",
            "bssid": "",
            "preSharedKey": "",
            "isHiddenSsid": false,
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_OPEN,
        };
        let promiseOne = new Promise((resolve, reject) => {
            wifi.addDeviceConfig(wifiDeviceConfig1,
                (err,netWorkId1) => {
                    if(err) {
                        console.info("[wifi_test]add callback failed : " + JSON.stringify(err)); }
                    console.info("[wifi_test] wifi addDeviceconfig1 callback:" + JSON.stringify(netWorkId1));
                    expect(true).assertEqual(netWorkId1 != -1);
                    console.info("[wifi_test] check add device configs successfully ");
                    var configs = wifi.getDeviceConfigs();
                    console.info("[wifi_test] wifi getDeviceConfigs result : " + JSON.stringify(configs));
                    expect(true).assertEqual(configs.length >= 1);
                    resolve()
                });
        })
        let promiseTwo = new Promise((resolve, reject) => {
            wifi.addDeviceConfig(wifiDeviceConfig2,
                (err,netWorkId2) => {
                    if(err) {
                        console.info("[wifi_test]add callback failed : " + JSON.stringify(err)); }
                    console.info("[wifi_test] wifi addDeviceconfig2 callback : " + JSON.stringify(netWorkId2));
                    expect(true).assertEqual(netWorkId2 != -1);
                    console.info("[wifi_test] check add device configs successfully ");
                    var configs = wifi.getDeviceConfigs();
                    console.info("[wifi_test] wifi getDeviceConfigs result : " + JSON.stringify(configs));
                    expect(true).assertEqual(configs.length >= 1);
                    console.info("[wifi_test] remove all configs");
                    var isRemoved = wifi.removeAllNetwork();
                    console.info("[wifi_test] check remove configs successfully,result:" + isRemoved);
                    expect(isRemoved).assertTrue();
                    var configs = wifi.getDeviceConfigs();
                    console.info("[wifi_test]remove configs,current get Configs : " + JSON.stringify(configs));
                    expect(true).assertEqual(configs.length == 0);
                    resolve()
                });
        })
        Promise.all([promiseOne, promiseTwo]).then(done)
    })

    /**
     * @tc.number     Config_0007
     * @tc.name       SUB_Communication_WiFi_Sta_Config_0007
     * @tc.desc       Test update wifi device config
     */
    it('SUB_Communication_WiFi_Sta_Config_0007', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Config_0007]");
        console.info("[wifi_test] create a valid wifi device config start.");
        var wifiDeviceConfig1 = {
            "ssid": "TEST",
            "bssid": "",
            "preSharedKey": "12345678",
            "isHiddenSsid": false,
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };

        await wifi.addDeviceConfig(wifiDeviceConfig1)
            .then(netWorkId => {
                console.info("[wifi_test]add PSK Deviceconfig promise : " + JSON.stringify(netWorkId));
                expect(true).assertEqual(netWorkId != -1);
                console.info("[wifi_test]connectdevice result: " + wifi.connectToNetwork(netWorkId));
                expect(wifi.connectToNetwork(netWorkId)).assertTrue();
                console.info("[wifi_test] get empty linked information and getIpInfo.");
                var disconNet = wifi.disableNetwork(netWorkId);
                console.log("[wifi_test] wifi disableNetwork result: " + disconNet);
                expect(disconNet).assertTrue();
                console.info("[wifi_test] check add device configs successfully ");
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test] wifi getDeviceConfigs result1 : " + JSON.stringify(configs));

                wifiDeviceConfig1.ssid = "UPDATE";
                wifiDeviceConfig1.preSharedKey = "1234567890";
                console.info("[wifi_test] wifi new wifiDeviceConfig1:" + wifi.updateNetwork(wifiDeviceConfig1));

                console.info("[wifi_test] check update device configs successfully ");
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test] updated wifi device config result : " + JSON.stringify(configs));
                expect(true).assertEqual(configs[1].ssid == wifiDeviceConfig1.ssid);
                expect(true).assertEqual(configs[1].preSharedKey == wifiDeviceConfig1.preSharedKey);

                console.info("[wifi_test] remove config");
                var isRemoved = wifi.removeAllNetwork();
                console.info("[wifi_test] check remove configs successfully,result:" + isRemoved);
                expect(isRemoved).assertTrue();
                var configs = wifi.getDeviceConfigs();
                console.info("[wifi_test]remove config,current get Config : " + JSON.stringify(configs));
                expect(true).assertEqual(configs.length == 0);
            });
        done()
    })

    /**
     * @tc.number     Info_0002
     * @tc.name       SUB_Communication_WiFi_Sta_Info_0002
     * @tc.desc       Test get CountryCode
     */
    it('SUB_Communication_WiFi_Sta_Info_0002', 0, function() {
        if (!wifi.isWifiActive()) {
            var enable = wifi.enableWifi();
            sleep(3000);
            expect(enable).assertTrue();
        }
        expect(wifi.isWifiActive()).assertTrue();
        console.info(" [wifi_test] getCountryCode start ... ");
        var countryCode = wifi.getCountryCode();
        console.info("[wifi_test] getCountryCode -> " + JSON.stringify(countryCode));
        expect(JSON.stringify(countryCode)).assertEqual('"CN"');
    })

    /**
     * @tc.number     Config_0002
     * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0001
     * @tc.desc       Test cnnnection a PSK SecurityType wifi deviceconfig
     */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0001', 0, async function() {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Config_0002]");
        console.info("[wifi_test] create a PSK SecurityType wifi device config start.");
        var wifiDeviceConfigConn = {
            "ssid": "TEST_CONN",
            "bssid": "",
            "preSharedKey": "12345678",
            "isHiddenSsid": false,
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        console.info("[wifi_test] connect wifi start.");
        var conn1 = wifi.connectToDevice(wifiDeviceConfigConn);
        sleep(5000);
        console.info("[wifi_test] isconnected wifi");
        var isConnected= wifi.isConnected();
        console.log("[wifi_test] wifi isConnected result: " + isConnected);
        expect(isConnected).assertFalse();
        wifi.getLinkedInfo((err, data) => {
            if (err) {
                return console.error('failed to get link infos callback because ' + JSON.stringify(err));
            }else {
                console.info("[wifi_test] get wifi link [callback] -> " + JSON.stringify(data));
                for (var j = 0; j < JSON.stringify(data).length; ++j) {
                    console.info("ssid: " + result[j].ssid);
                    console.info("bssid: " + result[j].bssid);
                    console.info("band: " + result[j].band);
                    console.info("isHidden: " + result[j].isHidden);
                    console.info("isRestricted: " + result[j].isRestricted);
                    console.info("chload: " + result[j].chload);
                    console.info("rssi " + result[j].rssi);
                    console.info("netWorkId: " + result[j].netWorkId);
                    console.info("linkSpeed: " + result[j].linkSpeed);
                    console.info("frequency: " + result[j].frequency);
                    console.info("snr: " + result[j].snr);
                    console.info("macAddress: " + result[j].macAddress);
                    console.info("ipAddress: " + result[j].ipAddress);
                    console.info("suppState: " + result[j].suppState);
                    console.info("connState: " + result[j].connState);
                }

            }
        });
        console.info("[wifi_test] get empty linked information and getIpInfo.");
        var discon2 = wifi.disconnect();
        console.log("[wifi_test] wifi disconnect result: " + discon2);
        expect(discon2).assertTrue();

    })

    
    /**
    * @tc.number     Conn_Info_0002
    * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0002
    * @tc.desc       Test get IpInfo information
    */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0002', 0, function () {
        
        console.info("[wifi_test] get IpInfo.");
        var ipInfo = wifi.getIpInfo();
        console.info("[wifi_test] getIpInfo -> " + JSON.stringify(ipInfo));
        expect(JSON.stringify(ipInfo)).assertContain("gateway");
        console.info("gateway: " + ipInfo.gateway);
        console.info("ipAddress: " + ipInfo.ipAddress);
        console.info("leaseDuration: " + ipInfo.leaseDuration);
        console.info("netmask: " + ipInfo.netmask);
        console.info("primaryDns: " + ipInfo.primaryDns);
        console.info("secondDns: " + ipInfo.secondDns);
        console.info("serverIp: " + ipInfo.serverIp);
    })

    /**
     * @tc.number SUB_Communication_WiFi_Sta_info_0004
     * @tc.name testFeatureSupported
     * @tc.desc Test FeatureSupported api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_info_0004', 0, function () {
        console.info('[wifi_test]FeatureSupported test start ...');
        var result = wifi.getSupportedFeatures();
        console.info("[wifi_test] getFeatureSupported -> " + JSON.stringify(result));
        console.info("[wifi_test] isFeatureSupported: " + result +"->" + wifi.isFeatureSupported(result));
        expect(wifi.isFeatureSupported(result)).assertTrue();
    })

    console.log("*************[wifi_test] start wifi js unit test end*************");
})

