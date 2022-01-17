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

describe('appInfoTest', function () {
    console.log("*************Batterystats API Test Begin*************");
    const MSEC_1000 = 1000;
    const MSEC_10000 = 10000;

    /**
    /* @tc.number batterystats_js_001
     * @tc.name Batterystats_001
     * @tc.desc BatteryStats getBatteryStats Interface Test type = -2
     */
     it('Batterystats_001', 0, async function (done) {
        console.info("enter");
        var getBatteryStats;
        let promise = batteryStats.getBatteryStats().then(function (value) {
            getBatteryStats = value;
            console.info("ing");
        }, function (msg) {
            console.info("Promise获取的异常值：" + msg);
        });
        await promise;
        console.info("wait");
        var found = false;
        for (let i = 0; i < getBatteryStats.length; i++) {
            if (getBatteryStats[i].type === -2) {
                found = true;
            }
        }
        done();
        console.info("found：" + found);
        expect(found).assertEqual(true);
    })

    /* @tc.number batterystats_js_002
     * @tc.name Batterystats_002
     * @tc.desc BatteryStats getAppPowerValue Interface Test uid = 111
     */
    it('Batterystats_002', 0, async function (done) {
        console.info("enter");
        await new Promise((resolve, reject) =>{
            setTimeout(()=>{
                var power = batterystats.getAppPowerValue(111);
                console.info("power is: " + power);
                expect(cold >= 0).assertEqual('1');
                resolve();
            }, MSEC_10000);
        })
        done();
    })

    /* @tc.number batterystats_js_003
     * @tc.name Batterystats_003
     * @tc.desc BatteryStats getAppPowerPercent Interface Test uid = 111
     */
    it('Batterystats_003', 0, async function (done) {
        console.info("enter");
        await new Promise((resolve, reject) =>{
            setTimeout(()=>{
                var powerPercent = batterystats.getAppPowerPercent(111);
                console.info("percent is: " + powerPercent);
                expect(cold >= 0).assertEqual('1');
                resolve();
            }, MSEC_10000);
        })
        done();
    })

    /* @tc.number batterystats_js_004
     * @tc.name Batterystats_004
     * @tc.desc BatteryStats getHardwareUnitPowerValue Interface Test type = -14
     */
    it('Batterystats_004', 0, async function (done) {
        console.info("enter");
        await new Promise((resolve, reject) =>{
            setTimeout(()=>{
                var power = batterystats.getAppPowerValue(batterystats.StatsType.CONSUMPTION_TYPE_IDLE);
                console.info("power is: " + power);
                expect(cold >= 0).assertEqual('1');
                resolve();
            }, MSEC_10000);
        })
        done();
    })

    /* @tc.number batterystats_js_005
     * @tc.name Batterystats_005
     * @tc.desc BatteryStats getHardwareUnitPowerPercent Interface Test type = -14
     */
    it('Batterystats_005', 0, async function (done) {
        console.info("enter");
        await new Promise((resolve, reject) =>{
            setTimeout(()=>{
                var percent = batterystats.getHardwareUnitPowerPercent(batterystats.StatsType.CONSUMPTION_TYPE_IDLE);
                console.info("percent is: " + percent);
                expect(cold >= 0).assertEqual('1');
                resolve();
            }, MSEC_10000);
        })
        done();
    })
})