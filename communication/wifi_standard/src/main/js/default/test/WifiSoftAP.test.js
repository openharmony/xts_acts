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

// delay x ms
function sleep(delay) {

    var start = (new Date()).getTime();
    while(true){
           if(new Date().getTime() - start >delay) {
               break;
        }
    }
}

var WifiSecurityType = {
    WIFI_SEC_TYPE_INVALID : 0,
    WIFI_SEC_TYPE_OPEN : 1,
    WIFI_SEC_TYPE_WEP : 2,
    WIFI_SEC_TYPE_PSK : 3,
    WIFI_SEC_TYPE_SAE : 4,
}

var HotspotConfig = {
    "ssid": "testWgr",
    "band": 1,
    "preSharedKey": "12345678",
    "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
    "maxConn": 8
}

describe('ACTS_WifiTest', function() {
    beforeEach(function () {
    })

    afterEach(function () {
    })

    /**
    * @tc.number     OPEN_0002
    * @tc.name       SUB_Communication_WiFi_Hotspot_Open_0002
    * @tc.desc       Test wifi.enableHotspot and wifi.disableHotspot API functionality1.
    * @tc.author     wudangping wwx1075776
    * @tc.level Level 0
    */
    it('SUB_Communication_WiFi_Hotspot_Open_0002', 0, function () {
        console.info("[wifi_test] SUB_Communication_WiFi_Hotspot_Open_0002");
        console.info("[wifi_test] enableHotspot and disableHotspot test start.");
	if (wifi.isWifiActive()) {
            var disable = wifi.disableWifi();
            sleep(5000);
            console.log("[wifi_test] wifi close result: " + disable);
            expect(disable).assertTrue();
        }
        var close =wifi.isWifiActive();
        console.info("[wifi_test] wifi status result: " + close);
        expect(close).assertTrue();
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        console.info('[wifi_test] test  enableHotspot and disableHotspot');
        var enHot = wifi.enableHotspot();
        sleep(5000);
        console.info("[wifi_test] enableHotspot result -> " + enHot);
        expect(wifi.isHotspotActive()).assertTrue();
        var disHot = wifi.disableHotspot();
        sleep(5000);
        console.info("[wifi_test] disableHotspot result -> " + disHot);
        console.info("[wifi_test] enableHotspot result -> " + wifi.isHotspotActive());
        expect(wifi.isHotspotActive()).assertFalse();
        console.info("[wifi_test] enableHotspot and disableHotspot test end.");
    })

    /**
    * @tc.number     OPEN_0003
    * @tc.name       SUB_Communication_WiFi_Hotspot_Open_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test open Hotspot after open wifi
    * @tc.level Level 1
    */
    it('SUB_Communication_WiFi_Hotspot_Open_0003', 0, function () {
        console.info("[wifi_test] SUB_Communication_WiFi_Hotspot_Open_0003");
        if (wifi.isHotspotActive()) {
            console.info("[wifi_test] close Hotspot test start.");
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        console.info('[wifi_test] test close wifi and enableHotspot start');
        var on = wifi.enableHotspot();
        sleep(5000);
        console.info("[wifi_test] enableHotspot result -> " + on);
        expect(wifi.isHotspotActive()).assertTrue();
        expect(wifi.isWifiActive()).assertFalse();

    })

    /**
    * @tc.number  CONFIG_0001
    * @tc.name    SUB_Communication_WiFi_Hotspot_Config_0001
    * @tc.author  wudangping wwx1075776
    * @tc.desc    Test set a valid 2.4G hotspot config
    * @tc.level   Level 0
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0001', 0, function () {
        console.info("[wifi_test] SUB_Communication_WiFi_Hotspot_Config_0001");
        console.info("[wifi_test] set a valid 2.4G hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        var isSuccess = wifi.setHotspotConfig(HotspotConfig);
        console.log("[wifi_test] set 2.4G hotspot config  result: " + isSuccess);
        expect(isSuccess).assertTrue();

        console.info("[wifi_test] check the state of hotspot, if it's inactive, open it.");
        if(!wifi.isHotspotActive()) {
            console.info("[wifi_test] open Hotspot test start.");
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_js] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot  " );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();

        console.info("[wifi_test] check band of current band should be 2.4G.");
        var hotspotConfig = wifi.getHotspotConfig();
        console.log("[wifi_test] getHotspotConfig  result: " + JSON.stringify(hotspotConfig));
        expect(hotspotConfig.band).assertEqual(1);
    })

    /**
    * @tc.number     CONFIG_0002
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0002
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a valid 5G hotspot config
    * @tc.level Level 1
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0002', 0, function () {
        console.info("[wifi_test] SUB_Communication_WiFi_Hotspot_Config_0002");
        console.info("[wifi_test] set a valid hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        var HotspotConfig5G = {
            "ssid": "testWgr",
            "band": 2,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess5 = wifi.setHotspotConfig(HotspotConfig5G);
        console.log("[wifi_test] set 5G hotspot config  result1: " + isSuccess5);
        expect(isSuccess5).assertFalse();
        console.info("[wifi_test] check the state of hotspot, if it's inactive, open it.");
        if (!wifi.isHotspotActive()) {
            console.info("[wifi_test] open Hotspot test start.");
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();
        console.info("[wifi_test] check band of current band should be 5G.");
        var hotspotConfig5 = wifi.getHotspotConfig();
        console.log("[wifi_test] getHotspotConfig  result: " + JSON.stringify(hotspotConfig5));
        expect(hotspotConfig5.band).assertEqual(1);
    })

    /**
    * @tc.number     CONFIG_0003
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0003
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a invalid  hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0003', 0, function () {
        console.info("[wifi_test] set a invalid hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        var HotspotConfig1= {
            "ssid": "testWgr",
            "band": 21,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfig1);
        console.log("[wifi_test] set invalid band hotspot config  result1:" + isSuccess1);
        expect(isSuccess1).assertFalse();

    })

    /**
    * @tc.number     CONFIG_0004
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0004
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a max preSharedKey is hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0004', 0, function () {
        console.info("[wifi_test] SUB_Communication_WiFi_Hotspot_Config_0004");
        console.info("[wifi_test] check the state of hotspot, if it's open, close it.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        console.log("[wifi_test] set max preSharedKey valid hotspot config " );
        var HotspotConfigM= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "123456789123456789123456789123456789123456789123456789123456789",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigM);
        console.log("[wifi_test] set max preSharedKey valid hotspot config  result: " + isSuccess1);
        expect(isSuccess1).assertTrue();
        console.info("[wifi_test] check the state of hotspot, if it's inactivated, open it.");
        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot  " );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();
        console.log("[wifi_test] set 65 preSharedKey invalid hotspot config  " );
        var HotspotConfigM1= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "1234567891234567891234567891234567891234567891234567891234567891",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigM1);
        console.log("[wifi_test] set 65 preSharedKey invalid hotspot config  result: " + isSuccess1);
        expect(isSuccess1).assertFalse();
    })

    /**
    * @tc.number     CONFIG_0005
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0005
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a min preSharedKey is hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0005', 0, function () {
        console.info("[wifi_test] check the state of hotspot, if it's open, close it.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        console.log("[wifi_test] set min preSharedKey valid hotspot config  " );
        var HotspotConfigI= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigI);
        console.log("[wifi_test] set 8 preSharedKey valid hotspot config result: " + isSuccess1);
        expect(isSuccess1).assertTrue();
        console.log("[wifi_test] check current hotspot config  preSharedKey is 8bit" );
        var config = wifi.getHotspotConfig();
        console.info("[wifi_test] getHotspotConfig result -> " + JSON.stringify(config));
        console.info("preSharedKey: " + config.preSharedKey);
        expect(config.preSharedKey.length).assertEqual(8);
        console.log("[wifi_test] set 7 preSharedKey invalid hotspot config" );
        var HotspotConfigI2= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "1234567",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigI2);
        console.log("[wifi_test] set 7 preSharedKey invalid hotspot config  result:" + isSuccess1);
        expect(isSuccess1).assertFalse();
        console.log("[wifi_test] check current hotspot config preSharedKey is 8bit" );
        var config = wifi.getHotspotConfig();
        console.info("[wifi_test] getHotspotConfig result -> " + JSON.stringify(config));
        console.info("preSharedKey: " + config.preSharedKey);
        expect(config.preSharedKey.length).assertEqual(8);
    })

    /**
    * @tc.number     CONFIG_0006
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0006
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a max ssid for hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0006', 0, function () {
        console.info("[wifi_test] check the state of hotspot, if it's open, close it.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_js] disableHotspot result -> " + off);
            expect(on2).assertTrue();
        }
        console.log("[wifi_test] set max ssid invalid hotspot config" );
        var HotspotConfigS= {
            "ssid": "testWgr123testWgr123testWgr12356",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigS);
        console.log("[wifi_test] set 32bit ssid invalid hotspot config result: " + isSuccess1);
        expect(isSuccess1).assertTrue();
        console.info("[wifi_test] check the state of hotspot, if it's inactivated, open it.");
        if (!wifi.isHotspotActive()) {
            var on2 = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on2);
            expect(on2).assertTrue();
        }
        console.log("[wifi_test] set 33bit ssid invalid hotspot config" );
        var HotspotConfigS1= {
            "ssid": "testWgr123testWgr123testWgr123567",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigS1);
        console.log("[wifi_test] set 33bit ssid invalid hotspot config  result: " + isSuccess1);
        expect(isSuccess1).assertFalse();

        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();

    })

    /**
    * @tc.number     CONFIG_0007
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0007
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a null ssid invalid  hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0007', 0, function () {
        console.info("[wifi_test] set a null ssid invalid hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        var HotspotConfigN= {
            "ssid": "",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigN);
        console.log("[wifi_test] set a null ssid invalid hotspot config  result1:" + isSuccess1);
        expect(isSuccess1).assertFalse();
    })

    /**
    * @tc.number     CONFIG_0008
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0008
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a contains Chinese.special.digits valid hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0008', 0, function () {
        console.info("[wifi_test] set contains Chinese valid hotspot config start.");
        var HotspotConfigC= {
            "ssid": "￥%￥#@12测试 ",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigC);
        console.log("[wifi_test] set a valid hotspot config  result1:" + isSuccess1);
        expect(isSuccess1).assertTrue();

        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot  " );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();
    })

    /**
    * @tc.number     CONFIG_0009
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0009
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a invalid preSharedKey hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0009', 0, function () {
        console.info("[wifi_test] set invalid hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + off);
            expect(off).assertTrue();

        }
        var HotspotConfigWep= {
            "ssid": "test123",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType":WifiSecurityType.WIFI_SEC_TYPE_WEP,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigWep);
        console.log("[wifi_test] set a invalid preSharedKey hotspot config  result1: " + isSuccess1);
        expect(isSuccess1).assertFalse();

        var HotspotConfigSAE= {
            "ssid": "test123",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType":WifiSecurityType.WIFI_SEC_TYPE_SAE,
            "maxConn": 8
        };
        var isSuccess2 = wifi.setHotspotConfig(HotspotConfigSAE);
        console.log("[wifi_test] set a invalid preSharedKey hotspot config  result1: " + isSuccess2);
        expect(isSuccess2).assertFalse();

        var HotspotConfigC= {
            "ssid": "test123",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType":12,
            "maxConn": 8
        };
        var isSuccess3 = wifi.setHotspotConfig(HotspotConfigC);
        console.log("[wifi_test] set a invalid preSharedKey hotspot config  result1: " + isSuccess3);
        expect(isSuccess3).assertFalse();

    })

    /**
    * @tc.number     CONFIG_0010
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0010
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a valid PSK preSharedKey hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0010', 0, function () {
        console.info("[wifi_test] set valid hotspot config start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + off);
            expect(off).assertTrue();

        }

        console.info("[wifi_test] set PSK securityType hotspot config start.");
        var HotspotConfigPSK= {
            "ssid": "test123",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType":WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        }
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigPSK);
        console.log("[wifi_test] set a PSK preSharedKey hotspot config  result1: " + isSuccess1);
        expect(isSuccess1).assertTrue();

        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();

        }
        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();

    })

    /**
    * @tc.number     CONFIG_0011
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0011
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a valid OPEN preSharedKey hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0011', 0, function () {
        console.info("[wifi_test] wifi disableHotspot start.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();
        }
        console.info("[wifi_test] set open securityType hotspot config start.");
        var HotspotConfigO= {
            "ssid": "test123",
            "band": 1,
            "preSharedKey": "",
            "securityType":WifiSecurityType.WIFI_SEC_TYPE_OPEN,
            "maxConn": 8
        }
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigO);
        console.log("[wifi_test] set a open preSharedKey hotspot config  result1: " + isSuccess1);
        expect(isSuccess1).assertTrue();

        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();

    })

    /**
    * @tc.number     CONFIG_0012
    * @tc.name       SUB_Communication_WiFi_Hotspot_Config_0012
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a valid hotspot config after open Hotspot
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Config_0012', 0, function () {
        console.info("[wifi_test] wifi enableHotspot start.");
        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();
        }
        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();
        console.info("[wifi_test] open Hotspot, set valid hotspot config start.");
        var HotspotConfigO= {
            "ssid": "测试3@%&*",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType":WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        }
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigO);
        console.log("[wifi_test] set a PSK preSharedKey hotspot config  result1: " + isSuccess1);
        expect(isSuccess1).assertTrue();
        console.info("[wifi_test] check the current config.");
        var config = wifi.getHotspotConfig();
        console.info("[wifi_test] getHotspotConfig result -> " + JSON.stringify(config));
        console.info("ssid: " + config.ssid);
        console.info("band: " + config.band);
        console.info("preSharedKey: " + config.preSharedKey);
        console.info("securityType: " + config.securityType);
        console.info("maxConn: " + config.maxConn);
        console.info("[wifi_test] check the current config is same with set before.");
        expect(config.ssid).assertEqual('测试3@%&*');
        expect(config.band).assertEqual(1);
        expect(config.preSharedKey).assertEqual('12345678');
        expect(config.securityType).assertEqual(3);
        expect(config.maxConn).assertEqual(8);
        console.info("[wifi_test] check the state of hotspot, if it's inactivated, open it.");
        expect(wifi.isHotspotActive()).assertTrue();
    })

    /**
    * @tc.number     CONN_0001
    * @tc.name       SUB_Communication_WiFi_Hotspot_Conn_0001
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test set a maxConn and more maxConn hotspot config
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Conn_0001', 0, function () {
        console.info("[wifi_test] check the state of hotspot, if it's open, close it.");
        if (wifi.isHotspotActive()) {
            var off = wifi.disableHotspot();
            sleep(5000);
            console.info("[wifi_test] disableHotspot result -> " + off);
            expect(off).assertTrue();

        }
        console.log("[wifi_test] set min maxConn valid hotspot config  " );
        var HotspotConfigI= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "12345678",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 8
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigI);
        console.log("[wifi_test] set maxConn valid hotspot config  result: " + isSuccess1);
        expect(isSuccess1).assertTrue();
        console.log("[wifi_test] check current hotspot config  maxConn is 8   " );
        var config = wifi.getHotspotConfig();
        console.info("[wifi_test] getHotspotConfig result -> " + JSON.stringify(config));
        console.info("ssid: " + config.maxConn);
        expect(config.maxConn).assertEqual(8);

        console.log("[wifi_test] set more maxConn invalid hotspot config" );
        var HotspotConfigI2= {
            "ssid": "testWgr",
            "band": 1,
            "preSharedKey": "1234567",
            "securityType": WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "maxConn": 9
        };
        var isSuccess1 = wifi.setHotspotConfig(HotspotConfigI2);
        console.log("[wifi_test] set  more maxConn invalid hotspot config  result: " + isSuccess1);
        expect(isSuccess1).assertFalse();
        console.log("[wifi_test] check current hotspot config maxConn" );
        var config = wifi.getHotspotConfig();
        console.info("[wifi_test] getHotspotConfig result -> " + JSON.stringify(config));
        console.info("ssid: " + config.maxConn);
        expect(config.maxConn).assertEqual(8);
    })

    /**
    * @tc.number     CONN_0002
    * @tc.name       SUB_Communication_WiFi_Hotspot_Conn_0002
    * @tc.author     wudangping wwx1075776
    * @tc.desc       Test Obtains the list of clients that are connected to a Wi-Fi hotspot.
    * @tc.level Level 2
    */
    it('SUB_Communication_WiFi_Hotspot_Conn_0002', 0, function () {
        console.info("[wifi_test] check the state of hotspot, if it's open, close it.");
        if (!wifi.isHotspotActive()) {
            var on = wifi.enableHotspot();
            sleep(5000);
            console.info("[wifi_test] enableHotspot result -> " + on);
            expect(on).assertTrue();

        }
        console.log("[wifi_test] check the state of Hotspot" );
        var isHotspotActive = wifi.isHotspotActive();
        console.info("[wifi_test] isHotspotActive -> " + isHotspotActive);
        expect(isHotspotActive).assertTrue();
        console.log("[wifi_test] Obtains the list of clients that are connected to Wi-Fi hotspot" );
        var stationInfo = wifi.getStations();
        console.info("[wifi_test] getStations result -> " + JSON.stringify(stationInfo));
        console.info("ssid: " + stationInfo.name);
        console.info("macAddress: " + stationInfo.macAddress);
        console.info("ipAddress: " + stationInfo.ipAddress);
        expect(config).assertEqual(8);

    })
    
    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_ON_0001
     * @tc.name testhotspotStateChangeOn
     * @tc.author  wudangping wwx1075776
     * @tc.desc Test hotspotStateChangeOn api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Hotspot_ON_0001', 0, async function (done) {
        console.info("[wifi_test]hotspotStateChange On test");
        try {
            wifi.on('hotspotStateChange', (data) => {
                console.info("[wifi_test] hotspotStateChange On ->" + data);
                expect(true).assertEqual(data != null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })
    
    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_Off_0002
     * @tc.name testhotspotStateChangeOff
     * @tc.desc Test hotspotStateChange api.
     * @tc.author  wudangping wwx1075776
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Off_0002', 0, async function (done) {
        try {
            wifi.off('hotspotStateChange', (data) => {
                console.info("[wifi_test] hotspotStateChange Off ->" + data);
                expect(true).assertEqual(data != null);
                console.info("[wifi_test] wifiRssiChange unregister end");
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_ON_0003
     * @tc.name testhotspotStaJoinOn
     * @tc.desc Test hotspotStaJoinOn api.
     * @tc.author wudangping wwx1075776
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Hotspot_ON_0003', 0, async function (done) {
        console.info("[wifi_test]hotspotStaJoin On test");
        try {
            wifi.on('hotspotStaJoin', (data) => {
                console.info("[wifi_test] hotspotStaJoin On ->" + data);
                expect(true).assertEqual(data != null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_Off_0004
     * @tc.name testhotspotStaJoinOff
     * @tc.desc Test hotspotStaJoin api.
     * @tc.author wudangping wwx1075776
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Off_0004', 0, async function (done) {
        try {
            wifi.off('hotspotStaJoin', (data) => {
                console.info("[wifi_test] hotspotStaJoin Off ->" + data);
                expect(true).assertEqual(data != null);
                console.info("[wifi_test] wifiRssiChange unregister end");
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_ON_0005
     * @tc.name testhotspotStaLeaveOn
     * @tc.desc Test hotspotStaLeaveOn api.
     * @tc.author  wudangping wwx1075776
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Hotspot_ON_0005', 0, async function (done) {
        console.info("[wifi_test]hotspotStaLeave On test");
        try {
            wifi.on('hotspotStaLeave', (data) => {
                console.info("[wifi_test] hotspotStaLeave On ->" + data);
                expect(true).assertEqual(data != null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_Communication_WiFi_Hotspot_Off_0006
     * @tc.name testhotspotStaLeaveOff
     * @tc.desc Test hotspotStaLeave api.
     * @tc.author  wudangping wwx1075776
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Communication_WiFi_Sta_Off_0006', 0, async function (done) {
        try {
            wifi.off('hotspotStaLeave', (data) => {
                console.info("[wifi_test] hotspotStaLeave Off ->" + data);
                expect(true).assertEqual(data != null);
                console.info("[wifi_test] hotspotStaLeave unregister end");
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    console.log("*************[wifi_test] start wifi js unit test end*************");
})
