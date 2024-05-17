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

import power from '@ohos.power';
import { describe, it, expect } from '@ohos/hypium'

export default function PowerManagerPowerTest() {
describe('PowerManagerPowerTest', function () {
    console.log("*************Power Unit Test Begin*************");

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0010
     * @tc.name testPower_Is_Screnn_On_Promise_Test
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Power_Is_Screnn_On_Promise_Test', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Promise_Test");
        let isScreenOn =  await power.isScreenOn();
        console.info('Power_Is_Screnn_On_Promise_Test isScreenOn is ' + isScreenOn);
        expect(isScreenOn).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0020
     * @tc.name testPower_Is_Screnn_On_Callback_Test
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Power_Is_Screnn_On_Callback_Test', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Callback_Test");
        power.isScreenOn((error, screenOn) => {
            if (typeof error === "undefined") {
                console.info('Power_Is_Screnn_On_Callback_Test screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('Power_Is_Screnn_On_Callback_Test success');
                done();
            } else {
                console.log('Power_Is_Screnn_On_Callback_Test: ' + error);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0030
     * @tc.name testPower_Is_Active_Test
     * @tc.desc On and Off Screen and get the current screen on and off
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Is_Active_Test', 0, function () {
        try {
            var isActive = power.isActive();
            console.info('power is active: ' + isActive);
            expect(isActive).assertNotNull();
        } catch(err) {
            console.error('check active status failed, err: ' + err);
        }        
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0040
     * @tc.name testPower_Get_Power_Mode_Test
     * @tc.desc Gets and sets the power mode
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Get_Power_Mode_Test', 0, async function () {
        let currentMode = power.getPowerMode();
        console.info('Power_Get_Power_Mode_Test currentMode:' + currentMode);
        expect(currentMode >= power.DevicePowerMode.MODE_NORMAL &&
            currentMode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0050
     * @tc.name testPower_Device_Power_Mode_MODENORMAL_Test
     * @tc.desc Get device power mode MODE_NORMAL
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODENORMAL_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_NORMAL;
        console.info('MODE_NORMAL = ' + devicePowerMode);
        expect(devicePowerMode === 600).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0060
     * @tc.name testPower_Device_Power_Mode_MODEPOWERSAVE_Test
     * @tc.desc Get device power mode MODE_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODEPOWERSAVE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_POWER_SAVE;
        console.info('MODE_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 601).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0070
     * @tc.name testPower_Device_Power_Mode_MODEPERFORMANCE_Test
     * @tc.desc Get device power mode MODE_PERFORMANCE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODEPERFORMANCE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_PERFORMANCE;
        console.info('MODE_PERFORMANCE = ' + devicePowerMode);
        expect(devicePowerMode === 602).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0080
     * @tc.name testPower_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_Test
     * @tc.desc Get device power mode MODE_EXTREME_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
        console.info('MODE_EXTREME_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 603).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0090
     * @tc.name testpower_Suspend_undefined_Test
     * @tc.desc Device suspend interface verification
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('power_Suspend_undefined_Test', 0, async function (done) {
        power.wakeupDevice("power_Suspend_undefined_Test");
        power.suspend(undefined);
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_undefined_Test ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0100
     * @tc.name testpower_Suspend_Device_Test
     * @tc.desc Device suspend interface verification
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('power_Suspend_Device_Test', 0, async function (done) {
        power.wakeupDevice("power_Suspend_Device_Test");
        power.suspend();
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_Device_Test ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0110
     * @tc.name testpower_Suspend_False_Test
     * @tc.desc Device suspend interface verification
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('power_Suspend_False_Test', 0, async function (done) {
        power.wakeupDevice("power_Suspend_False_Test");
        power.suspend(false);
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_False_Test ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0120
     * @tc.name testpower_Device_IsStandby_Test
     * @tc.desc Device isStandby interface verification
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('power_Device_IsStandby_Test', 0, function () {
        let isStandby = power.isStandby();
        console.info('power_Device_IsStandby_Test ' + isStandby);
        expect(isStandby).assertFalse();
    })
})
}
