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
import batteryStats from "@ohos.batteryStatistics"
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
    console.log("*************batteryStats API Test Begin*************");

    /**
    /* @tc.number batteryStats_js_001
     * @tc.name batteryStats_001
     * @tc.desc batteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_BLUETOOTH
     */
    it('batteryStats_001', 0, async function (done) {
        var infoList;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_BLUETOOTH) {
                expect(infoList[i].uid).assertEqual(-1);
                console.info("Found Bluetooth consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batteryStats_js_002
     * @tc.name batteryStats_002
     * @tc.desc batteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('batteryStats_002', 0, async function (done) {
        var infoList;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_IDLE) {
                expect(infoList[i].uid).assertEqual(-1);
                console.info("Found Idle consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batteryStats_js_003
     * @tc.name batteryStats_003
     * @tc.desc batteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_PHONE
     */
    it('batteryStats_003', 0, async function (done) {
        var infoList;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_PHONE) {
                expect(infoList[i].uid).assertEqual(-1);
                console.info("Found Phone consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batteryStats_js_004
     * @tc.name batteryStats_004
     * @tc.desc batteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_RADIO
     */
    it('batteryStats_004', 0, async function (done) {
        var infoList;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_RADIO) {
                expect(infoList[i].uid).assertEqual(-1);
                console.info("Found Radio consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /**
    /* @tc.number batteryStats_js_005
     * @tc.name batteryStats_005
     * @tc.desc batteryStats getBatteryStats Interface Test type = ConsumptionType.CONSUMPTION_TYPE_SCREEN
     */
    it('batteryStats_005', 0, async function (done) {
        var infoList;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            infoList = value;
            console.info("Executing");
        }, function (msg) {
            console.info("Promise error：" + msg);
        });
        await promise;
        console.info("Waiting");
        var found = false;
        for (let i = 0; i < infoList.length; i++) {
            if (infoList[i].type == ConsumptionType.CONSUMPTION_TYPE_SCREEN) {
                expect(infoList[i].uid).assertEqual(-1);
                console.info("Found Screen consumption");
                found = true;
            }
        }
        done();
        expect(found).assertTrue();
    })

    /* @tc.number batteryStats_js_006
     * @tc.name batteryStats_006
     * @tc.desc batteryStats getAppPowerValue Interface Test uid = 111
     */
    it('batteryStats_006', 0, function () {
        var power = batteryStats.getAppPowerValue(111);
        console.info("App consumption power of uid 111 is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_007
     * @tc.name batteryStats_007
     * @tc.desc batteryStats getAppPowerValue Interface Test uid = -111
     */
    it('batteryStats_007', 0, function () {
        var power = batteryStats.getAppPowerValue(-111);
        console.info("App consumption power of uid -111 is: " + power);
        expect(power).assertEqual(0);
    })

    /* @tc.number batteryStats_js_008
     * @tc.name batteryStats_008
     * @tc.desc batteryStats getAppPowerValue Interface Test uid = 0
     */
    it('batteryStats_008', 0, function () {
        var power = batteryStats.getAppPowerValue(0);
        console.info("App consumption power of uid 0 is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_009
     * @tc.name batteryStats_009
     * @tc.desc batteryStats getAppPowerValue Interface Test uid = "111"
     */
    it('batteryStats_009', 0, function () {
        try{
            batteryStats.getAppPowerValue("111");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_010
     * @tc.name batteryStats_010
     * @tc.desc batteryStats getAppPowerValue Interface Test uid = 111, 222
     */
    it('batteryStats_010', 0, function () {
        try{
            batteryStats.getAppPowerValue(111, 222);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_011
     * @tc.name batteryStats_011
     * @tc.desc batteryStats getAppPowerPercent Interface Test uid = 111
     */
    it('batteryStats_011', 0, function () {
        var powerPercent = batteryStats.getAppPowerPercent(111);
        console.info("App consumption percent of uid 111 is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_012
     * @tc.name batteryStats_012
     * @tc.desc batteryStats getAppPowerPercent Interface Test uid = -111
     */
    it('batteryStats_012', 0, function () {
        var powerPercent = batteryStats.getAppPowerPercent(-111);
        console.info("App consumption percent of uid -111 is: " + powerPercent);
        expect(powerPercent).assertEqual(0);
    })

    /* @tc.number batteryStats_js_013
     * @tc.name batteryStats_013
     * @tc.desc batteryStats getAppPowerPercent Interface Test uid = 0
     */
    it('batteryStats_013', 0, function () {
        var powerPercent = batteryStats.getAppPowerPercent(0);
        console.info("App consumption percent of uid 0 is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_014
     * @tc.name batteryStats_014
     * @tc.desc batteryStats getAppPowerPercent Interface Test uid = "111"
     */
    it('batteryStats_014', 0, function () {
        try{
            batteryStats.getAppPowerPercent("111");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_015
     * @tc.name batteryStats_015
     * @tc.desc batteryStats getAppPowerPercent Interface Test uid = 111, 222
     */
    it('batteryStats_015', 0, function () {
        try{
            batteryStats.getAppPowerPercent(111, 222);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_016
     * @tc.name batteryStats_016
     * @tc.desc batteryStats getHardwareUnitPowerValue Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('batteryStats_016', 0, function () {
        var power = batteryStats.getHardwareUnitPowerValue(ConsumptionType.CONSUMPTION_TYPE_IDLE);
        console.info("Idle consumption power is: " + power);
        expect(power >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_017
     * @tc.name batteryStats_017
     * @tc.desc batteryStats getHardwareUnitPowerValue Interface Test type = 111
     */
    it('batteryStats_017', 0, function () {
        var power = batteryStats.getHardwareUnitPowerValue(111);
        console.info("111's consumption power is: " + power);
        expect(power).assertEqual(0);
    })

    /* @tc.number batteryStats_js_018
     * @tc.name batteryStats_018
     * @tc.desc batteryStats getHardwareUnitPowerValue Interface Test type = 0
     */
    it('batteryStats_018', 0, function () {
        var power = batteryStats.getHardwareUnitPowerValue(0);
        console.info("0's consumption power is: " + power);
        expect(power).assertEqual(0);
    })

    /* @tc.number batteryStats_js_019
     * @tc.name batteryStats_019
     * @tc.desc batteryStats getHardwareUnitPowerValue Interface Test type = "test"
     */
    it('batteryStats_019', 0, function () {
        try{
            batteryStats.getHardwareUnitPowerValue("test");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_020
     * @tc.name batteryStats_020
     * @tc.desc batteryStats getHardwareUnitPowerValue Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     * and ConsumptionType.CONSUMPTION_TYPE_WIFI
     */
    it('batteryStats_020', 0, function () {
        try{
            batteryStats.getHardwareUnitPowerValue(ConsumptionType.CONSUMPTION_TYPE_IDLE,
                ConsumptionType.CONSUMPTION_TYPE_WIFI);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_021
     * @tc.name batteryStats_021
     * @tc.desc batteryStats getHardwareUnitPowerPercent Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     */
    it('batteryStats_021', 0, function () {
        var powerPercent = batteryStats.getHardwareUnitPowerPercent(ConsumptionType.CONSUMPTION_TYPE_IDLE);
        console.info("Idle consumption percent is: " + powerPercent);
        expect(powerPercent >= 0).assertTrue();
    })

    /* @tc.number batteryStats_js_022
     * @tc.name batteryStats_022
     * @tc.desc batteryStats getHardwareUnitPowerPercent Interface Test type = 111
     */
    it('batteryStats_022', 0, function () {
        var powerPercent = batteryStats.getHardwareUnitPowerPercent(111);
        console.info("111's consumption percent is: " + powerPercent);
        expect(powerPercent).assertEqual(0);
    })

    /* @tc.number batteryStats_js_023
     * @tc.name batteryStats_023
     * @tc.desc batteryStats getHardwareUnitPowerPercent Interface Test type = 0
     */
    it('batteryStats_023', 0, function () {
        var powerPercent = batteryStats.getHardwareUnitPowerPercent(0);
        console.info("0's consumption percent is: " + powerPercent);
        expect(powerPercent).assertEqual(0);
    })

    /* @tc.number batteryStats_js_024
     * @tc.name batteryStats_024
     * @tc.desc batteryStats getHardwareUnitPowerPercent Interface Test type = "test"
     */
    it('batteryStats_024', 0, function () {
        try{
            batteryStats.getHardwareUnitPowerPercent("test");
        } catch(e) {
            var errorMsg = "Argument type check works: " + e;
            console.debug("errorMsg");
            expect(errorMsg.includes("Wrong argument type")).assertTrue();
        }
    })

    /* @tc.number batteryStats_js_025
     * @tc.name batteryStats_025
     * @tc.desc batteryStats getHardwareUnitPowerPercent Interface Test type = ConsumptionType.CONSUMPTION_TYPE_IDLE
     * and ConsumptionType.CONSUMPTION_TYPE_WIFI
     */
    it('batteryStats_025', 0, function () {
        try{
            batteryStats.getHardwareUnitPowerPercent(ConsumptionType.CONSUMPTION_TYPE_IDLE,
                ConsumptionType.CONSUMPTION_TYPE_WIFI);
        } catch(e) {
            var errorMsg = "Argument number check works: " + e;
            console.debug(errorMsg);
            expect(errorMsg.includes("Wrong number of arguments")).assertTrue();
        }
    })
})