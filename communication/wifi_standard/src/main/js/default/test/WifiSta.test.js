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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

import wifi from '@ohos.wifi'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}


let WifiSecurityType = {
    WIFI_SEC_TYPE_INVALID: 0,
    WIFI_SEC_TYPE_OPEN: 1,
    WIFI_SEC_TYPE_WEP: 2,
    WIFI_SEC_TYPE_PSK: 3,
    WIFI_SEC_TYPE_SAE: 4,
}

function checkWifiPowerOn(){
    console.info("wifi_test/wifi status:" + wifi.isWifiActive());
    expect(wifi.isWifiActive()).assertTrue();
}
let WifiDeviceConfig = {
    "ssid": "TEST",
    "bssid": "",
    "preSharedKey": "",
    "isHiddenSsid": false,
    "securityType":WifiSecurityType.WIFI_SEC_TYPE_OPEN ,
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

describe('ACTS_WifiTest', function() {
    beforeEach(function() {
        checkWifiPowerOn();
    })

    afterEach(function() {})

    /**
     * @tc.number     open_0001
     * @tc.name       SUB_Communication_WiFi_Sta_Open_0001
     * @tc.desc       Test wifi.isWifiEnable API functionality.
     */
    it('SUB_Communication_WiFi_Sta_Open_0001', 0,  function() {
        console.info("[wifi_test] check the state of wifi, if it's close, open it.");
        let active = wifi.isWifiActive();
        console.log("[wifi_test]  check the state of wifi: " + wifi.isWifiActive());
        expect(wifi.isWifiActive()).assertTrue();
    })

    /**
     * @tc.number     Scan_0001
     * @tc.name       SUB_Communication_WiFi_Sta_Scan_0001
     * @tc.desc       Test get ScanInfos callback API functionality.
     */
    it('SUB_Communication_WiFi_Sta_Scan_0001', 0, async function(done) { 
        let scan = wifi.scan();
        await sleep(3000);
        console.log("[wifi_test] open wifi scan result: " + scan);
        expect(scan).assertTrue();

        await wifi.getScanInfos()
            .then(result => {
                let clen = Object.keys(result).length;
                expect(clen).assertLarger(0);
                console.info("[wifi_test] getScanInfos promise result " + JSON.stringify(result));
            });

        wifi.getScanInfos(
            (err,result) => {
                if(err) {
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
                          "frequency: " + result[j].frequency +
                          "timestamp" + result[j].timestamp + "capabilities" + result[j].capabilities
                          + "channelWidth: " + result[j].channelWidth);
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
    it('SUB_Communication_WiFi_Sta_Scan_0004', 0,  function() {
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
     * @tc.number SUB_Communication_WiFi_Sta_info_0002
     * @tc.name testgetCountryCode
     * @tc.desc Test getCountryCode api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Info_0002', 0,  function() {
        expect(wifi.isWifiActive()).assertTrue();
        console.info(" [wifi_test] getCountryCode start ... ");
        let countryCode = wifi.getCountryCode();
        console.info("[wifi_test] getCountryCode -> " + JSON.stringify(countryCode));
        expect(JSON.stringify(countryCode)).assertEqual('"CN"');
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
        expect(wifi.isWifiActive()).assertTrue();
        let WifiUtils = {
            WIFI_FEATURE_INFRA: 0x0001,
            WIFI_FEATURE_INFRA_5G: 0x0002,
            WIFI_GAS_ANQP: 0x0004,
            WIFI_WIFI_DIRECT: 0x0008,
            WIFI_FEATURE_MOBILE_HOTSPOT: 0x0010,
            WIFI_FEATURE_AWARE: 0x0040,
            WIFI_FEATURE_AP_STA: 0x8000,
            WIFI_FEATURE_WPA3_SAE: 0x8000000,
            WIFI_FEATURE_WPA3_SUITE_B:0x10000000,
            WIFI_FEATURE_OWE:0x20000000
        }
        let isSupport1 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_INFRA);
        expect(isSupport1).assertFalse();
        let isSupport2 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_INFRA_5G);
        expect(isSupport2).assertFalse();
        let isSupport3 = wifi.isFeatureSupported(WifiUtils.WIFI_GAS_ANQP);
        expect(isSupport3).assertFalse();
        let isSupport4 = wifi.isFeatureSupported(WifiUtils.WIFI_WIFI_DIRECT);
        expect(isSupport4).assertFalse();
        let isSupport5 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_MOBILE_HOTSPOT);
        expect(isSupport5).assertFalse();
        let isSupport6 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_AWARE);
        expect(isSupport6).assertFalse();
        let isSupport7 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_AP_STA);
        expect(isSupport7).assertFalse();
        let isSupport8 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_WPA3_SAE);
        expect(isSupport8).assertFalse();
        let isSupport9 = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_WPA3_SUITE_B);
        expect(isSupport9).assertFalse();
        let isSupport = wifi.isFeatureSupported(WifiUtils.WIFI_FEATURE_OWE);
        expect(isSupport).assertFalse();
    })
 
    /**
     * @tc.number     conn_Config_0002
     * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0002
     * @tc.desc       Test getLinkedInfo information
     */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0002', 0, async function(done) {
        console.info("[wifi_test]isConnected : " + wifi.isConnected());
        expect(wifi.isConnected()).assertFalse();
        await wifi.getLinkedInfo()
            .then((result) => {
                console.info("[wifi_test] get wifi link [promise] -> " + JSON.stringify(result));
                expect(JSON.stringify(result)).assertContain('band');
                done();
            }).catch((error) => {
                console.info("[wifi_test] promise then error." + JSON.stringify(error));
                expect().assertFail();
            });
    })

    /**
     * @tc.number     conn_Config_0003
     * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0003
     * @tc.desc       Test getLinkedInfo callback information
     */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0003', 0, async function(done) {
        console.info("[wifi_test]isConnected : " + wifi.isConnected());
        expect(wifi.isConnected()).assertFalse();
        await wifi.getLinkedInfo(
            (err,result) => {
                if(err) {
                    console.log("[wifi_test] wifi getLinkedInfo failed " + err);
                }
                let clen = Object.keys(result).length;
                expect(clen).assertLarger(0);
                console.info("[wifi_test] getLinkedInfo callback result: " + JSON.stringify(result));
                console.info("ssid: " + result.ssid + "bssid:"+ result.bssid +"band: " + result.band+
                "isHidden: " + result.isHidden + "isRestricted: " + result.isRestricted +
                "rssi " + result.rssi + 
                "linkSpeed: " + result.linkSpeed + "frequency:" 
                 + result.frequency +
                "macAddress: " + result.macAddress + "ipAddress: " + result.ipAddress + 
                 "connState: " + result.connState);
                done();
            });   
    })

    /**
    * @tc.number     Conn_Info_0001
    * @tc.name       SUB_Communication_WiFi_Sta_Conn_Info_0001
    * @tc.desc       Test get IpInfo information
    */
    it('SUB_Communication_WiFi_Sta_Conn_Info_0001', 0,  function () {
        let isConnected= wifi.isConnected();
        expect(isConnected).assertFalse();
        let ipInfo = wifi.getIpInfo();
        expect(JSON.stringify(ipInfo)).assertContain("gateway");
        console.info("gateway: " + ipInfo.gateway + "ipAddress: " + ipInfo.ipAddress
         + "leaseDuration: " + ipInfo.leaseDuration + 
        "leaseDuration: " + ipInfo.leaseDuration + 
        "netmask: " + ipInfo.netmask + "primaryDns:" + ipInfo.primaryDns +
        "secondDns: " + ipInfo.secondDns + "serverIp: " + ipInfo.serverIp );
    })

   /**
    * @tc.number     wifiStateChange_0001
    * @tc.name       SUB_Communication_WiFi_Sta_wifiStateChange_0001
    * @tc.desc       Test wifiStateChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiStateChange_0001', 0, async function (done) {
        wifi.on('wifiStateChange', async result => {
             console.info("wifiStateChange callback, result:" + JSON.stringify(result));
             expect(true).assertEqual(result !=null);
             let promise = new Promise((resolve) => {
                wifi.off('wifiStateChange', result => {
                    console.info("offwifiStateChange callback, result: " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                    resolve()
                });
            })
             await promise.then(done)
        }); 
        done();
    })

  /**
    * @tc.number     wifiConnectionChange_0002
    * @tc.name       SUB_Communication_WiFi_Sta_wifiConnectionChange_0002
    * @tc.desc       Test wifiStateChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiConnectionChange_0002', 0, async function (done) {
        wifi.on('wifiConnectionChange', async result => {
            console.info("wifiConnectionChange callback, result:" + JSON.stringify(result));
            expect(true).assertEqual(result !=null);
            let promise = new Promise((resolve) => {
                console.info('[wifi_test] offwifiConnectionChange test start ...');
                wifi.off('wifiConnectionChange', result => {
                    console.info("offwifiConnectionChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                    resolve()
                });
            })
            await promise.then(done)
         });
        done(); 
    })

   /**
    * @tc.number     wifiScanStateChange_0003
    * @tc.name       SUB_Communication_WiFi_Sta_wifiScanStateChange_0003
    * @tc.desc       Test wifiScanStateChange callback
    */
    it('SUB_Communication_WiFi_Sta_wifiScanStateChange_0003', 0, async function (done) {
        wifi.on('wifiScanStateChange', async result => {
             console.info("wifiScanStateChange callback, result:" + JSON.stringify(result));
             expect(true).assertEqual(result !=null);
             let promise = new Promise((resolve) => {
                console.info('[wifi_test] offwifiScanStateChange test start ...');
                wifi.off('wifiScanStateChange', result => {
                    console.info("offwifiScanStateChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
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
    * @tc.number     wifiRssiChange_0004
    * @tc.name       SUB_Communication_WiFi_Sta_wifiRssiChange_0004
    * @tc.desc       Test wifiRssiChange callback
    */
   it('SUB_Communication_WiFi_Sta_wifiRssiChange_0004', 0, async function (done) {
        wifi.on('wifiRssiChange', async result => {
             console.info("wifiRssiChange callback, result:" + JSON.stringify(result));
             expect(true).assertEqual(result !=null);
             let promise = new Promise((resolve) => {
                console.info('[wifi_test] offwifiRssiChange test start ...');
                wifi.off('wifiRssiChange', result => {
                    console.info("offwifiRssiChange callback, result:  " + JSON.stringify(result));
                    expect(true).assertEqual(result !=null);
                    resolve()
                });
            })
            await promise.then(done)
         });  
         done();  
           
    })
 
    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_ON_0001
     * @tc.name testhotspotStateChangeOn
     * @tc.desc Test hotspotStateChangeOn api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Hotspot_ON_0001', 0, async function (done) {
        console.info("[wifi_test]hotspotStateChange On test");
        try {
            await wifi.on('hotspotStateChange', (data) => {
                console.info("[wifi_test] hotspotStateChange On ->" + data);
                expect(true).assertEqual(data != null);
            });
            
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })
    
    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_Off_0002
     * @tc.name testhotspotStateChangeOff
     * @tc.desc Test hotspotStateChange api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Off_0002', 0, async function (done) {
        try {
           await wifi.off('hotspotStateChange', (data) => {
                console.info("[wifi_test] hotspotStateChange Off ->" + data);
                expect(true).assertEqual(data != null);
                console.info("[wifi_test] wifiRssiChange unregister end");
            });
            
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })
    console.log("*************[wifi_test] start wifi js unit test end*************");
})



