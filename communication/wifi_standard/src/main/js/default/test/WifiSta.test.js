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

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

var WifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_OPEN: 1,
    WIFI_SEC_TYPE_WEP: 2,
    WIFI_SEC_TYPE_PSK: 3,
    WIFI_SEC_TYPE_SAE: 4,
}

var SuppState = {
    DISCONNECTED: 0,
    INTERFACE_DISABLED: 1,
    INACTIVE : 2,
    SCANNING: 3,
    AUTHENTICATING: 4,
    ASSOCIATING: 5,
    ASSOCIATED: 6,
    FOUR_WAY_HANDSHAKE: 7,
    GROUP_HANDSHAKE: 8,
    COMPLETED: 9,
    UNINITIALIZED: 10,
    INVALID: 11,
}

var wifiDeviceConfig = {
    "ssid": "TEST",
    "bssid": "A1:B1:C1:D1:E1:F1",
    "preSharedKey": "12345678",
    "isHiddenSsid": false,
    "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
}

var ConnState = {
    SCANNING: 0,
    CONNECTING: 1,
    AUTHENTICATING: 2,
    OBTAINING_IPADDR: 3,
    CONNECTED: 4,
    DISCONNECTING: 5,
    DISCONNECTED: 6,
    UNKNOWN: 7,
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
    it('SUB_Communication_WiFi_Sta_Open_0001', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Open_0001]");
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        var active = wifi.isWifiActive();
        if (!active) {
            var enable = wifi.enableWifi();
            await sleep(5000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        console.info("[wifi_test] close wifi test start.");
        var disable = wifi.disableWifi();
        await sleep(5000);
        console.log("[wifi_test] wifi close result: " + disable);
        expect(disable).assertTrue();
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertFalse();
        done();
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
            await sleep(5000);
            console.log("[wifi_test] wifi open result: " + enable);
            expect(enable).assertTrue();
        }
        var scan = wifi.scan();
        await sleep(3000);
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
                if (!(clen == 0)) {
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
        wifi.removeAllNetwork();
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
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK
        };

        await wifi.addDeviceConfig(wifiDeviceConfig1)
            .then(netWorkId => {
                console.info("[wifi_test]add PSK Deviceconfig promise : " + JSON.stringify(netWorkId));
                expect(true).assertEqual(netWorkId != -1);
                console.info("[wifi_test]connectdevice result: " + wifi.connectToNetwork(netWorkId));
                expect(wifi.connectToNetwork(netWorkId)).assertTrue();
                console.info("[wifi_test] disableNetwork test start.");
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
     * @tc.number SUB_Communication_WiFi_Sta_info_0001
     * @tc.name testgetMacAddress
     * @tc.desc Test getMacAddress api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_info_0001', 0, async function (done) {
        if (!wifi.isWifiActive()) {
           var enable = wifi.enableWifi();
           await sleep(3000);
           expect(enable).assertTrue();
       }
       expect(wifi.isWifiActive()).assertTrue();
       console.info('[wifi_test] getDeviceMacAddress test start ...');
       var result = wifi.getDeviceMacAddress();
       console.info("[wifi_test] getDeviceMacAddress -> " + JSON.stringify(result));
       expect(true).assertEqual(result.length >= 1)
       done();
   })

    /**
     * @tc.number SUB_Communication_WiFi_Sta_info_0002
     * @tc.name testgetCountryCode
     * @tc.desc Test getCountryCode api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Info_0002', 0, async function(done) {
        if (!wifi.isWifiActive()) {
            var enable = wifi.enableWifi();
            await sleep(3000);
            expect(enable).assertTrue();
        }
        expect(wifi.isWifiActive()).assertTrue();
        console.info(" [wifi_test] getCountryCode start ... ");
        var countryCode = wifi.getCountryCode();
        console.info("[wifi_test] getCountryCode -> " + JSON.stringify(countryCode));
        expect(JSON.stringify(countryCode)).assertEqual('"CN"');
        done()
    })
   
    /**
     * @tc.number SUB_Communication_WiFi_Sta_info_0004
     * @tc.name testFeatureSupported
     * @tc.desc Test FeatureSupported api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_info_0004', 0,  function () {
        console.info('[wifi_test]FeatureSupported test start ...');
        var result = wifi.getSupportedFeatures();
        console.info("[wifi_test] getFeatureSupported -> " + JSON.stringify(result));
        console.info("[wifi_test] isFeatureSupported: " + result +"->" + wifi.isFeatureSupported(result));
        expect(wifi.isFeatureSupported(result)).assertTrue();
    })


    /**
    * @tc.number     Conn_Info_0001
    * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0001
    * @tc.desc       Test reconnect wifi
    */
   it('SUB_Communication_WiFi_Sta_Conn_Info_0001', 0, async function (done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Conn_Info_0001]");
        console.info("[wifi_test] wifi connectToDevice test.");
        var wifiDeviceConfigConn = {
        "ssid": "TESTCONN",
        "bssid": "",
        "preSharedKey": "12345678",
        "isHiddenSsid": false,
        "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        var active = wifi.isWifiActive();
        console.log("[wifi_test] wifi active result2: " + active);
        if(!active){
            var enable = wifi.enableWifi();
            expect(enable).assertTrue();
            await sleep(3000);
        }
        var result1 = wifi.connectToDevice(wifiDeviceConfigConn);
        console.log("[wifi_test] wifi connectToDevice result: " + result1);
        expect(result1).assertTrue();
        console.info("[wifi_test] check isconnected wifi");
        var isConnected= wifi.isConnected();
        console.log("[wifi_test] wifi isConnected result: " + isConnected);
        expect(isConnected).assertFalse();
        console.info("[wifi_test] reconnect wifi");
        var reconn= wifi.reconnect();
        console.log("[wifi_test] wifi reconnect result: " + reconn);
        expect(reconn).assertTrue();
        console.info("[wifi_test] remove config");
        var isRemoved = wifi.removeAllNetwork();
        console.info("[wifi_test] check remove configs successfully,result:" + isRemoved);
        expect(isRemoved).assertTrue();
        var configs = wifi.getDeviceConfigs();
        console.info("[wifi_test]remove config,current get Config : " + JSON.stringify(configs));
        expect(true).assertEqual(configs.length == 0);
        done()

    })
    
    /**
     * @tc.number     conn_Config_0002
     * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0002
     * @tc.desc       Test getLinkedInfo information
     */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0002', 0, async function(done) {
        console.info("[wifi_test][SUB_Communication_WiFi_Sta_Conn_Info_0002]");
        console.info("[wifi_test] Wifi get link infos  test[1].");
        await wifi.getLinkedInfo()
            .then((result) => {
                console.info("[wifi_test] get wifi link [promise] -> " + JSON.stringify(result));
                expect(JSON.stringify(result)).assertContain('band');
                console.info("[wifi_js] get wifi link [promise].");
                done();
            }).catch((error) => {
                console.info("[wifi_test] promise then error." + JSON.stringify(error));
                expect().assertFail();
            });
        await wifi.getLinkedInfo(
            (err,result) => {
                if(err) {
                    console.log("[wifi_test] wifi getLinkedInfo failed " + err);
                }
                var clen = Object.keys(result).length;
                console.log("[wifi_test] wifi getLinkedInfo callback result length: " + clen);
                expect(clen).assertLarger(0);
                console.info("[wifi_test] getLinkedInfo callback result: " + JSON.stringify(result));
                console.info("ssid: " + result.ssid);
                console.info("bssid: " + result.bssid);
                console.info("band: " + result.band);
                console.info("isHidden: " + result.isHidden);
                console.info("isRestricted: " + result.isRestricted);
                console.info("chload: " + result.chload);
                console.info("rssi " + result.rssi);
                console.info("netWorkId: " + result.netWorkId);
                console.info("linkSpeed: " + result.linkSpeed);
                console.info("frequency: " + result.frequency);
                console.info("snr: " + result.snr);
                console.info("macAddress: " + result.macAddress);
                console.info("ipAddress: " + result.ipAddress);
                console.info("suppState: " + result.suppState);
                console.info("connState: " + result.connState);
                done();
            });
            
    })

    /**
    * @tc.number     Conn_Info_0003
    * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0003
    * @tc.desc       Test get IpInfo information
    */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0003', 0, async function (done) {
        console.info("[wifi_test] wifi connectToDevice test.");
        var wifiDeviceConfigIp = {
            "ssid": "TEST1",
            "bssid": "",
            "preSharedKey": "87654321",
            "isHiddenSsid": "false",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        var result1 = wifi.connectToDevice(wifiDeviceConfigIp);
        await sleep(2000);
        console.log("[wifi_test] wifi connectToDevice result: " + result1);
        expect(result1).assertTrue();
        console.info("[wifi_test] check isconnected wifi");
        var isConnected= wifi.isConnected();
        console.log("[wifi_test] wifi isConnected result: " + isConnected);
        expect(isConnected).assertFalse();
        console.info("[wifi_test] reassociate wifi");
        var reass= wifi.reassociate();
        console.log("[wifi_test] wifi reassociate result: " + reass);
        expect(reass).assertTrue();
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
        console.info("[wifi_test] remove config");
        var isRemoved = wifi.removeAllNetwork();
        console.info("[wifi_test] check remove configs successfully,result:" + isRemoved);
        expect(isRemoved).assertTrue();
        var configs = wifi.getDeviceConfigs();
        console.info("[wifi_test]remove config,current get Config : " + JSON.stringify(configs));
        expect(true).assertEqual(configs.length == 0);
        done()
    })

   /**
    * @tc.number     wifiStateChange_0001
    * @tc.name       SUB_Communication_WiFi_Sta_wifiStateChange_0001
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test wifiStateChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiStateChange_0001', 0, async function (done) {
        console.info('[wifi_test] OnWifiStateChange test start ...');
        await wifi.on('wifiStateChange', result => {
            console.info("onwifiStateChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offwifiStateChange test start ...');
            wifi.off('wifiStateChange', result => {
                console.info("offwifiStateChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 2 * 1000);
        done();
    })

   /**
    * @tc.number     wifiConnectionChange_0002
    * @tc.name       SUB_Communication_WiFi_Sta_wifiConnectionChange_0002
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test wifiConnectionChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiConnectionChange_0002', 0, async function (done) {
        console.info('[wifi_test] OnwifiConnectionChange test start...');
        await wifi.on('wifiConnectionChange', result => {
            console.info("onwifiConnectionChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offwifiConnectionChange test start ...');
            wifi.off('wifiConnectionChange', result => {
                console.info("offwifiConnectionChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 2 * 1000);
        done();
    })
 
   /**
    * @tc.number     wifiConnectionChange_0002
    * @tc.name       SUB_Communication_WiFi_Sta_wifiConnectionChange_0002
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test wifiConnectionChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiScanStateChange_0003', 0, async function (done) {
        console.info('[wifi_test] OnwifiScanStateChange test start...');
        await wifi.on('wifiScanStateChange', result => {
            console.info("onwifiScanStateChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offwifiScanStateChange test start ...');
            wifi.off('wifiScanStateChange', result => {
                console.info("offwifiScanStateChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 2 * 1000);
        done();
    })

   /**
    * @tc.number     wifiRssiChange_0004
    * @tc.name       SUB_Communication_WiFi_Sta_wifiRssiChange_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test wifiRssiChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiRssiChange_0004', 0, async function (done) {
        console.info('[wifi_test] OnwifiRssiChange test start...');
        await wifi.on('wifiRssiChange', result => {
            console.info("onwifiRssiChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offwifiRssiChange test start ...');
            wifi.off('wifiRssiChange', result => {
                console.info("offwifiRssiChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 2 * 1000);
        done();
    })

   /**
    * @tc.number     streamChange_0004
    * @tc.name       SUB_Communication_WiFi_Sta_streamChange_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test streamChange callback
    */
    it('SUB_Communication_WiFi_Sta_streamChange_0005', 0, async function (done) {
        console.info('[wifi_test] OnstreamChange test start...');
        await wifi.on('streamChange', result => {
            console.info("onstreamChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            done();
        });
        setTimeout(function() {
            console.info('[wifi_test] offstreamChange test start ...');
            wifi.off('streamChange', result => {
                console.info("offstreamChange callback, result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        }, 2 * 1000);
        done();
    })

    console.log("*************[wifi_test] start wifi js unit test end*************");
})



