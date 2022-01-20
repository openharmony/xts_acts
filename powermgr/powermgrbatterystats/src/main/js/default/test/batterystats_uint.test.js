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

import app from '@system.app'
import batterystats from "@ohos.batterystats"
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

var ConsumptionType = {
    CONSUMPTION_TYPE_INVALID : -17,
    CONSUMPTION_TYPE_APP : -16,
    CONSUMPTION_TYPE_BLUETOOTH : -15,
    CONSUMPTION_TYPE_IDLE : -14,
    CONSUMPTION_TYPE_PHONE : -13,
    CONSUMPTION_TYPE_RADIO : -12,
    CONSUMPTION_TYPE_SCREEN : -11,
    CONSUMPTION_TYPE_USER : -10,
    CONSUMPTION_TYPE_WIFI : -9,
}

describe('appInfoTest', function () {
    console.log("*************Batterystats API Test Begin*************");

    /**
    /* @tc.number batterystats_js_001
     * @tc.name Batterystats_001
     * @tc.desc BatteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_BLUETOOTH
     */
    it('Batterystats_001', 0, async function (done) {
        var infoList;
        let promise = batterystats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_BLUETOOTH && infoList[i].uid == -1) {
                console.info("Found Bluetooth consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batterystats_js_002
     * @tc.name Batterystats_002
     * @tc.desc BatteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('Batterystats_002', 0, async function (done) {
        var infoList;
        let promise = batterystats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_IDLE && infoList[i].uid == -1) {
                console.info("Found Idle consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batterystats_js_003
     * @tc.name Batterystats_003
     * @tc.desc BatteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_PHONE
     */
    it('Batterystats_003', 0, async function (done) {
        var infoList;
        let promise = batterystats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_PHONE && infoList[i].uid == -1) {
                console.info("Found Phone consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batterystats_js_004
     * @tc.name Batterystats_004
     * @tc.desc BatteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_RADIO
     */
    it('Batterystats_004', 0, async function (done) {
        var infoList;
        let promise = batterystats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_RADIO && infoList[i].uid == -1) {
                console.info("Found Radio consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batterystats_js_005
     * @tc.name Batterystats_005
     * @tc.desc BatteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_SCREEN
     */
    it('Batterystats_005', 0, async function (done) {
        var infoList;
        let promise = batterystats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_SCREEN && infoList[i].uid == -1) {
                console.info("Found Screen consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /* @tc.number batterystats_js_006
     * @tc.name Batterystats_006
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = 111
     */
    it('Batterystats_006', 0, function () {
        var power = batterystats.getAppPowerValue(111);
        console.info("App consumption power of uid 111 is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_007
     * @tc.name Batterystats_007
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = -111
     */
    it('Batterystats_007', 0, function () {
        var power = batterystats.getAppPowerValue(-111);
        console.info("App consumption power of uid -111 is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_008
     * @tc.name Batterystats_008
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = 0
     */
    it('Batterystats_008', 0, function () {
        var power = batterystats.getAppPowerValue(0);
        console.info("App consumption power of uid 0 is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_009
     * @tc.name Batterystats_009
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = "111"
     */
    it('Batterystats_009', 0, function () {
        try{
            batterystats.getAppPowerValue("111");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_010
     * @tc.name Batterystats_010
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = 111, 222
     */
    it('Batterystats_010', 0, function () {
        try{
            batterystats.getAppPowerValue(111, 222);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_011
     * @tc.name Batterystats_011
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = 111
     */
    it('Batterystats_011', 0, function () {
        var powerPercent = batterystats.getAppPowerPercent(111);
        console.info("App consumption percent of uid 111 is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_012
     * @tc.name Batterystats_012
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = -111
     */
    it('Batterystats_012', 0, function () {
        var powerPercent = batterystats.getAppPowerPercent(-111);
        console.info("App consumption percent of uid -111 is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_013
     * @tc.name Batterystats_013
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = 0
     */
    it('Batterystats_013', 0, function () {
        var powerPercent = batterystats.getAppPowerPercent(0);
        console.info("App consumption percent of uid 0 is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_014
     * @tc.name Batterystats_014
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = "111"
     */
    it('Batterystats_014', 0, function () {
        try{
            batterystats.getAppPowerPercent("111");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_015
     * @tc.name Batterystats_015
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = 111, 222
     */
    it('Batterystats_015', 0, function () {
        try{
            batterystats.getAppPowerPercent(111, 222);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_016
     * @tc.name Batterystats_016
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('Batterystats_016', 0, function () {
        var power = batterystats.getHardwareUnitPowerValue(ConsumptionType.CONSUMPTION_TYPE_IDLE);
        console.info("Idle consumption power is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_017
     * @tc.name Batterystats_017
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = 111
     */
    it('Batterystats_017', 0, function () {
        var power = batterystats.getHardwareUnitPowerValue(111);
        console.info("111's consumption power is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_018
     * @tc.name Batterystats_018
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = 0
     */
    it('Batterystats_018', 0, function () {
        var power = batterystats.getHardwareUnitPowerValue(0);
        console.info("0's consumption power is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_019
     * @tc.name Batterystats_019
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = "test"
     */
    it('Batterystats_019', 0, function () {
        try{
            batterystats.getHardwareUnitPowerValue("test");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_020
     * @tc.name Batterystats_020
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     * and ConsumptionType.CONSUMPTION_TYPE_WIFI
     */
    it('Batterystats_020', 0, function () {
        try{
            batterystats.getHardwareUnitPowerValue(ConsumptionType.CONSUMPTION_TYPE_IDLE,
                ConsumptionType.CONSUMPTION_TYPE_WIFI);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_021
     * @tc.name Batterystats_021
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('Batterystats_021', 0, function () {
        var power = batterystats.getHardwareUnitPowerPercent(ConsumptionType.CONSUMPTION_TYPE_IDLE);
        console.info("Idle consumption percent is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_022
     * @tc.name Batterystats_022
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = 111
     */
    it('Batterystats_022', 0, function () {
        var power = batterystats.getHardwareUnitPowerPercent(111);
        console.info("111's consumption percent is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_023
     * @tc.name Batterystats_023
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = 0
     */
    it('Batterystats_023', 0, function () {
        var power = batterystats.getHardwareUnitPowerPercent(0);
        console.info("0's consumption percent is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batterystats_js_024
     * @tc.name Batterystats_024
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = "test"
     */
    it('Batterystats_024', 0, function () {
        try{
            batterystats.getHardwareUnitPowerPercent("test");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batterystats_js_025
     * @tc.name Batterystats_025
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     * and ConsumptionType.CONSUMPTION_TYPE_WIFI
     */
    it('Batterystats_025', 0, function () {
        try{
            batterystats.getHardwareUnitPowerPercent(ConsumptionType.CONSUMPTION_TYPE_IDLE,
                ConsumptionType.CONSUMPTION_TYPE_WIFI);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })
})