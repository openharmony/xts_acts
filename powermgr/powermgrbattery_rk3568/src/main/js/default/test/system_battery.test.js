/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import battery from '@system.battery';
import batteryInfo from '@ohos.batteryInfo';
import { describe } from 'deccjsunit/index'

describe('appInfoTest', function () {
  console.log("*************System Battery Unit Test Begin*************");

    /**
     * @tc.number system_battery_js_0100
     * @tc.name get_status_test_success
     * @tc.desc Battery acquisition kit
     */
    it('get_status_test_success', 0, function () {
        let execSucc = false
        let execcomplete = false
        battery.getStatus({
            success: (data) => {
                execSucc = true
                let batterySoc = (batteryInfo.batterySOC * 0.01);
                console.log("batterySoc: " + batterySoc + ", data.level: " + data.levet)
                expect(fabs(data.levet - batterySoc) <= 1e-9).assertTrue()
                if (batteryInfo.chargingStatus == batteryInfo.BatteryChargeState.ENABLE) {
                    expect(data.charging).assertTrue()
                } else {
                    expect(data.charging).assertFalse()
                }
            },
            fail: (data, code) => {
                console.log("get_status_test_success, data: " + data + ", code: " + code);
                expect(true).assertFalse()
            },
            complete: () => {
                execcomplete = true
                expect(true).assertTrue()
                console.log("The device information is obtained successfully. Procedure");
            }
        });
        expect(execSucc).assertTrue()
        expect(execcomplete).assertTrue()
    })

    /**
     * @tc.number system_battery_js_0200
     * @tc.name get_status_test_fail
     * @tc.desc Battery acquisition kit
     */
     it('get_status_test_fail', 0, function () {
        let exec = false
        let execcomplete = false
        battery.getStatus({
            success: null,
            fail: (data, code) => {
                console.log("get_status_test_fail, data: " + data + ", code: " + code);
                exec = true;
                // The success argument is not a function, code: -4
                expect(code == -4).assertTrue()
            },
            complete: () => {
                execcomplete = true
                expect(true).assertTrue()
                console.log("The device information is obtained successfully. Procedure");
            }
        });
        expect(exec).assertTrue()
        expect(execcomplete).assertTrue()
    })

    /**
     * @tc.number system_battery_js_0300
     * @tc.name get_status_test_complete
     * @tc.desc Battery acquisition kit
     */
     it('get_status_test_complete', 0, function () {
        let execcomplete = false
        battery.getStatus({
            success: null,
            fail: null,
            complete: () => {
                execcomplete = true
                expect(true).assertTrue()
                console.log("The device information is obtained successfully. Procedure");
            }
        });
        expect(execcomplete).assertTrue()
    })

    /**
     * @tc.number system_battery_js_0400
     * @tc.name get_status_test_parameter_is_null
     * @tc.desc Battery acquisition kit
     */
     it('get_status_test_parameter_is_null', 0, function () {
        battery.getStatus({
            success: null,
            fail: null,
            complete: null
        });
        expect(true).assertTrue()
    })

    /**
     * @tc.number system_battery_js_0500
     * @tc.name get_status_test_parameter_is_empty
     * @tc.desc Battery acquisition kit
     */
     it('get_status_test_parameter_is_empty', 0, function () {
        battery.getStatus();
        expect(true).assertTrue()
    })
})