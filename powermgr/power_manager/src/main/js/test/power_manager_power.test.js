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
    
    // New interface
    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0110
     * @tc.name Power_Get_Set_Mode_Promise_JSTest0110
     * @tc.desc Gets and sets the power mode
     */
     it('Power_Get_Set_Mode_Promise_JSTest0110', 0, async function (done) {
        let currentMode = power.getPowerMode();
        console.info('Power_Get_Set_Mode_Promise_JSTest0110 currentMode:' + currentMode);
        expect(currentMode >= power.DevicePowerMode.MODE_NORMAL &&
            currentMode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE).assertTrue();
        try {
            let isExec = false;
            power.setPowerMode(power.DevicePowerMode.MODE_POWER_SAVE)
                .then((error) => {
                    isExec = true;
                    console.info('Power_Get_Set_Mode_Promise_JSTest0110 error:' + (typeof error));
                    expect(typeof error === "undefined").assertTrue();
                    let mode = power.getPowerMode();
                    console.info('Power_Get_Set_Mode_Promise_JSTest0110 mode:' + mode);
                    expect(mode === power.DevicePowerMode.MODE_POWER_SAVE).assertTrue();
                }).finally(() => {
                    expect(isExec).assertTrue();
                })
        } catch (e) {
            console.info('Power_Get_Set_Mode_Promise_JSTest0110 error:' + e);
            expect().assertFail();
        }
        power.setPowerMode(currentMode);
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0120
     * @tc.name Power_Get_Set_Mode_Promise_Invalid_JSTest0120
     * @tc.desc Set the wrong power mode
     */
    it('Power_Get_Set_Mode_Promise_Invalid_JSTest0120', 0, async function (done) {
        try {
            // invalid mode
            power.setPowerMode('').then(() => {
                console.info('Power_Get_Set_Mode_Promise_Invalid_JSTest0120 string failed');
                expect().assertFail();
            })
        } catch (e) {
            console.info('Power_Get_Set_Mode_Promise_Invalid_JSTest0120 code:' + e.code + 'msg:' + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }

        try {
            // Number of invalid parameters
            power.setPowerMode('', '', 0).then(() => {
                console.info('Power_Get_Set_Mode_Promise_Invalid_JSTest0120 number failed');
                expect().assertFail();
            })
        } catch (e) {
            console.info('Power_Get_Set_Mode_Promise_Invalid_JSTest0120 code:' + e.code + 'msg:' + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0130
     * @tc.name Power_Get_Set_Mode_Callback_JSTest0130
     * @tc.desc Gets and sets the power mode
     */
    it('Power_Get_Set_Mode_Callback_JSTest0130', 0, async function (done) {
        let currentMode = power.getPowerMode();
        console.info('Power_Get_Set_Mode_Callback_JSTest0130 currentMode:' + currentMode);
        expect(currentMode >= power.DevicePowerMode.MODE_NORMAL &&
            currentMode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE).assertTrue();
        try {
            power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE, (error) => {
                console.info('Power_Get_Set_Mode_Callback_JSTest0130 error:' + (typeof error));
                expect(typeof error === "undefined").assertTrue();
                let mode = power.getPowerMode();
                console.info('Power_Get_Set_Mode_Callback_JSTest0130 mode:' + mode);
                expect(mode === power.DevicePowerMode.MODE_PERFORMANCE).assertTrue();
            })
        } catch (e) {
            console.info('Power_Get_Set_Mode_Callback_JSTest0130 error:' + e);
            expect().assertFail();
        }
        power.setPowerMode(currentMode);
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0140
     * @tc.name Power_Get_Set_Mode_Callback_Invalid_JSTest0140
     * @tc.desc Set the wrong power mode
     */
    it('Power_Get_Set_Mode_Callback_Invalid_JSTest0140', 0, async function (done) {
        try {
            // invalid mode
            power.setPowerMode('', (error) => {
                expect().assertFail();
            })
        } catch (e) {
            console.info('Power_Get_Set_Mode_Callback_Invalid_JSTest0140 code:' + e.code + 'msg:' + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }

        try {
            // invalid callback
            power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE, '')
        } catch (e) {
            console.info('Power_Get_Set_Mode_Callback_Invalid_JSTest0140 code:' + e.code + 'msg:' + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }
        done();
    })

     /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0150
     * @tc.name Power_Reboot_JSTest0150
     * @tc.desc reboot
     */
      it('Power_Reboot_JSTest0150', 0, function () {
        // Reboot tests are not performed by default
        if (false) {
            try {
                power.reboot('Power_Reboot_JSTest0150');
            } catch (e) {
                console.info('Power_Reboot_JSTest0150 error:' + e);
                expect().assertFail();
            }
        }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0160
     * @tc.name Power_Wakeup_Suspend_IsActive_JSTest0160
     * @tc.desc On and Off Screen and get the current screen on and off
     */
    it('Power_Wakeup_Suspend_IsActive_JSTest0160', 0, function () {
        try {
            power.suspend();
            power.wakeup('wakeup_suspend_isPower_Wakeup_Suspend_IsActive_JSTest0160_active');
            let on = power.isActive();
            console.info('Power_Wakeup_Suspend_IsActive_JSTest0160 on:' + on);
            expect(on).assertTrue();
            power.suspend();
            let off = power.isActive();
            console.info('Power_Wakeup_Suspend_IsActive_JSTest0160 off:' + off);
            expect(off).assertFalse();
        } catch (e) {
            console.info('Power_Wakeup_Suspend_IsActive_JSTest0160:' + e);
            expect().assertFail();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0170
     * @tc.name Power_Wakeup_Invalid_JSTest0170
     * @tc.desc wakeup Input invalid parameter
     */
    it('Power_Wakeup_Invalid_JSTest0170', 0, function () {
        try {
            power.wakeup(0)
        } catch (e) {
            console.info('Power_Wakeup_Invalid_JSTest0170 code:' + e.code + "msg:" + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }

        try {
            // The number of parameters does not match
            power.wakeup('', 0)
        } catch (e) {
            console.info('Power_Wakeup_Invalid_JSTest0170 code:' + e.code + "msg:" + e.message);
            // 401: Invalid input parameter
            expect(e.code === 401).assertTrue();
        }
    })
})
}
