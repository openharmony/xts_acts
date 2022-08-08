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
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0010
     * @tc.name Power_Is_Screnn_On_Promise_JSTest0010
     * @tc.desc Checks whether the screen of a device is on or off
     */
    it('Power_Is_Screnn_On_Promise_JSTest0010', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Promise_JSTest0010");
        power.isScreenOn()
            .then(screenOn => {
                console.info('Power_Is_Screnn_On_Promise_JSTest0010 screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('Power_Is_Screnn_On_Promise_JSTest0010 success');
                done();
            })
            .catch(error => {
                console.log('Power_Is_Screnn_On_Promise_JSTest0010 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0020
     * @tc.name Power_Is_Screnn_On_Callback_JSTest0020
     * @tc.desc Checks whether the screen of a device is on or off
     */
    it('Power_Is_Screnn_On_Callback_JSTest0020', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Callback_JSTest0020");
        power.isScreenOn((error, screenOn) => {
            if (typeof error === "undefined") {
                console.info('Power_Is_Screnn_On_Callback_JSTest0020 screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('Power_Is_Screnn_On_Callback_JSTest0020 success');
                done();
            } else {
                console.log('Power_Is_Screnn_On_Callback_JSTest0020: ' + error);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0030
     * @tc.name Power_WakeupDevices_String_JSTest0030
     * @tc.desc Try to wakeup the device and let screen on
     */
    it('Power_WakeupDevices_String_JSTest0030', 0, async function (done) {
        power.isScreenOn()
            .then(screenOn => {
                console.info('Power_WakeupDevices_String_JSTest0030: The current screenOn is ' + screenOn);
                if (screenOn) {
                    power.suspendDevice();
                }  
            })
            .catch(error => {
                console.log('Power_WakeupDevices_String_JSTest0030 error: ' + error);
                expect().assertFail();
                done();
            })
        setTimeout(function(){
            power.wakeupDevice("Power_WakeupDevices_String_JSTest0030");
            power.isScreenOn()
            .then(screenOn => {
                console.info('Power_WakeupDevices_String_JSTest0030: The current screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('Power_WakeupDevices_String_JSTest0030 success');
                done();
            })
            .catch(error => {
                console.log('Power_WakeupDevices_String_JSTest0030 error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0040
     * @tc.name Power_SuspendDevices_JSTest0040
     * @tc.desc Try to suspend the device and let screen off
     */
    it('Power_SuspendDevices_JSTest0040', 0, async function (done) {
        power.isScreenOn()
            .then(screenOn => {
                console.info('Power_SuspendDevices_JSTest0040: The current screenOn is ' + screenOn);
                if (!screenOn) { 
                    power.wakeupDevice("Power_SuspendDevices_JSTest0040");
                } 
            })
            .catch(error => {
                console.log('Power_SuspendDevices_JSTest0040 error: ' + error);
                expect().assertFail();
                done();
            })
        setTimeout(function(){
            power.suspendDevice();
            console.info('Power_SuspendDevices_JSTest0040: SuspendDevice end');
            power.isScreenOn()
            .then(screenOn => {
                console.info('Power_SuspendDevices_JSTest0040: The current screenOn is ' + screenOn);
                expect(screenOn).assertFalse();
                console.info('Power_SuspendDevices_JSTest0040 success');
                done();
            })
            .catch(error => {
                console.log('Power_SuspendDevices_JSTest0040 error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0050
     * @tc.name Power_Get_PowerMode_Callback_JSTest0050
     * @tc.desc Get The mode the device
     */
     it('Power_Get_PowerMode_Callback_JSTest0050', 0, async function (done) {
        power.getPowerMode()
        .then(powerMode => {
            console.info('Power_Get_PowerMode_Callback_JSTest0050 power mode is ' + powerMode);
            expect(powerMode >= 600 && powerMode <= 603).assertTrue();
            done();
        })
        .catch(error => {
            console.log('Power_Get_PowerMode_Callback_JSTest0050 error: ' + error);
            expect().assertFail();
            done();
        })    
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0060
     * @tc.name Power_Get_PowerMode_Promise_JSTest0060
     * @tc.desc Get The mode the device
     */
    it('Power_Get_PowerMode_Promise_JSTest0060', 0, async function (done) {
        power.getPowerMode((error, powerMode) => {
            if (typeof error === "undefined") {
                console.info('Power_Get_PowerMode_Promise_JSTest0060 power mode is ' + powerMode);
                expect(powerMode >= 600 && powerMode <= 603).assertTrue();
                done();
            } else {
                console.log('Power_Get_PowerMode_Promise_JSTest0060: ' + error);
                expect().assertFail();
                done();
            }    
        })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0070
     * @tc.name Power_Device_Power_Mode_MODENORMAL_JSTest0070
     * @tc.desc Get device power mode MODE_NORMAL
     */
     it('Power_Device_Power_Mode_MODENORMAL_JSTest0070', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_NORMAL;
        console.info('MODE_NORMAL = ' + devicePowerMode);
        expect(devicePowerMode === 600).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0080
     * @tc.name Power_Device_Power_Mode_MODEPOWERSAVE_JSTest0080
     * @tc.desc Get device power mode MODE_POWER_SAVE
     */
     it('Power_Device_Power_Mode_MODEPOWERSAVE_JSTest0080', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_POWER_SAVE;
        console.info('MODE_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 601).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0090
     * @tc.name Power_Device_pPower_Mode_MODEPERFORMANCE_JSTest0090
     * @tc.desc Get device power mode MODE_PERFORMANCE
     */
     it('Power_Device_pPower_Mode_MODEPERFORMANCE_JSTest0090', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_PERFORMANCE;
        console.info('MODE_PERFORMANCE = ' + devicePowerMode);
        expect(devicePowerMode === 602).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0100
     * @tc.name Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_JSTest0100
     * @tc.desc Get device power mode MODE_EXTREME_POWER_SAVE
     */
     it('Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_JSTest0100', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
        console.info('MODE_EXTREME_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 603).assertTrue();
      })
})
}
