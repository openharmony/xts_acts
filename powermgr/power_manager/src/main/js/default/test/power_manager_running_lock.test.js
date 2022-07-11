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

import runningLock from '@ohos.runninglock'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('appInfoTest_power_2', function () {
    console.log("*************RunningLock Unit Test Begin*************");

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0110
     * @tc.name Create_Running_Lock_Promise_JSTest0010
     * @tc.desc Create running lock
     */
    it('Create_Running_Lock_Promise_JSTest0010', 0, async function (done) {
        runningLock.createRunningLock("running_lock_test_1", runningLock.RunningLockType.BACKGROUND)
            .then(runninglock => {
                expect(runninglock !== null).assertTrue();
                console.info('Create_Running_Lock_Promise_JSTest0010 success');
                done();
            })
            .catch(error => {
                console.log('Create_Running_Lock_Promise_JSTest0010 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0120
     * @tc.name Create_Running_Lock_CallBack_JSTest0020
     * @tc.desc Create running lock
     */
    it('Create_Running_Lock_CallBack_JSTest0020', 0, async function (done) {
        runningLock.createRunningLock("running_lock_test_2", runningLock.RunningLockType.BACKGROUND,
            (error, runninglock) => {
                if (typeof error === "undefined") {
                    console.info('Create_Running_Lock_CallBack_JSTest0020: runningLock is ' + runninglock);
                    expect(runninglock !== null).assertTrue();
                    let used = runninglock.isUsed();
                    console.info('Create_Running_Lock_CallBack_JSTest0020 is used: ' + used);
                    expect(used).assertFalse();
                    runninglock.lock(500);
                    used = runninglock.isUsed();
                    console.info('after lock Create_Running_Lock_CallBack_JSTest0020 is used: ' + used);
                    expect(used).assertTrue();
                    console.info('Create_Running_Lock_CallBack_JSTest0020 success');
                    done();
                } else {
                    console.log('Create_Running_Lock_CallBack_JSTest0020: ' + error);
                    expect().assertFail();
                    done();
                }
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0130
     * @tc.name Running_Lock_Lock_JSTest0030
     * @tc.desc Prevents the system from hibernating and sets the lock duration
     */
    it('Running_Lock_Lock_JSTest0030', 0, async function (done) {
        runningLock.createRunningLock("running_lock_test_3", runningLock.RunningLockType.BACKGROUND)
            .then(runninglock => {
                expect(runninglock !== null).assertTrue();
                let used = runninglock.isUsed();
                console.info('Running_Lock_Lock_JSTest0030 is used: ' + used);
                expect(used).assertFalse();
                runninglock.lock(500);
                used = runninglock.isUsed();
                console.info('after lock Running_Lock_Lock_JSTest0030 is used: ' + used);
                expect(used).assertTrue();
                console.info('Running_Lock_Lock_JSTest0030 success');
                done();
            })
            .catch(error => {
                console.log('Running_Lock_Lock_JSTest0030 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0140
     * @tc.name Running_Lock_used_JSTest0040
     * @tc.desc Checks whether a lock is held or in use
     */
    it('Running_Lock_used_JSTest0040', 0, async function (done) {
        runningLock.createRunningLock("running_lock_test_4", runningLock.RunningLockType.BACKGROUND)
            .then(runninglock => {
                expect(runninglock !== null).assertTrue();
                let used = runninglock.isUsed();
                console.info('Running_Lock_used_JSTest0040 used: ' + used);
                expect(used).assertFalse();
                console.info('Running_Lock_used_JSTest0040 success');
                done();
            })
            .catch(error => {
                console.log('Running_Lock_used_JSTest0040 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0150
     * @tc.name Running_Lock_Unlock_JSTest0050
     * @tc.desc Release running lock
     */
    it('Running_Lock_Unlock_JSTest0050', 0, async function (done) {
        runningLock.createRunningLock("running_lock_test_5", runningLock.RunningLockType.BACKGROUND)
            .then(runninglock => {
                expect(runninglock !== null).assertTrue();
                let used = runninglock.isUsed();
                console.info('Running_Lock_Unlock_JSTest0050 is used: ' + used);
                expect(used).assertFalse();
                runninglock.lock(500);
                used = runninglock.isUsed();
                console.info('after lock Running_Lock_Unlock_JSTest0050 is used: ' + used);
                expect(used).assertTrue();
                runninglock.unlock();
                used = runninglock.isUsed();
                console.info('after unlock Running_Lock_Unlock_JSTest0050 is used: ' + used);
                expect(used).assertFalse();
                console.info('Running_Lock_Unlock_JSTest0050 success');
                done();
            })
            .catch(error => {
                console.log('Running_Lock_Unlock_JSTest0050 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0160
     * @tc.name Enum_RunningLock_Type_Background_JSTest0060
     * @tc.desc The lock type is BACKGROUND
     */
    it('Enum_RunningLock_Type_Background_JSTest0060', 0, function () {
        let runningLockType = runningLock.RunningLockType.BACKGROUND;
        console.info('runningLockType = ' + runningLockType);
        expect(runningLockType == 1).assertTrue();
        console.info('Enum_RunningLock_Type_Background_JSTest0060 success');
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0170
     * @tc.name Enum_RunningLock_Type_Proximityscreencontrol_JSTest0070
     * @tc.desc The lock type is PROXIMITY_SCREEN_CONTROL
     */
    it('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0070', 0, function () {
        let runningLockType = runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL;
        console.info('runningLockType = ' + runningLockType);
        expect(runningLockType == 2).assertTrue();
        console.info('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0070 success');
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0180
     * @tc.name Is_Runninglock_Type_Supported_Promise_Test1_JSTest0080
     * @tc.desc Checks whether the specified RunningLockType is supported.
     */
    it('Is_Runninglock_Type_Supported_Promise_Test1_JSTest0080', 0, async function (done) {
        runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
            .then(supported => {
                console.info('is_runninglock_type_supported_test_1 PROXIMITY_SCREEN_CONTROL supported is ' + supported);
                expect(supported).assertTrue();
                console.info('is_runninglock_type_supported_test_1 success');
                done();
            })
            .catch(error => {
                console.log('is_runninglock_type_supported_test_1 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0190
     * @tc.name Is_Runninglock_Type_Supported_Promise_Test2_JSTest0090
     * @tc.desc Checks whether the specified RunningLockType is supported.
     */
    it('Is_Runninglock_Type_Supported_Promise_Test2_JSTest0090', 0, async function (done) {
        runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND)
            .then(supported => {
                console.info('Is_Runninglock_Type_Supported_Promise_Test2 BACKGROUND supported is ' + supported);
                expect(supported).assertTrue();
                console.info('Is_Runninglock_Type_Supported_Promise_Test2 success');
                done();
            })
            .catch(error => {
                console.log('Is_Runninglock_Type_Supported_Promise_Test2 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0200
     * @tc.name Is_Runninglock_Type_Supported_Callback_test3_JSTest0100
     * @tc.desc Checks whether the specified RunningLockType is supported.
     */
    it('Is_Runninglock_Type_Supported_Callback_test3_JSTest0100', 0, async function (done) {
        runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND, (error, supported) => {
            if (typeof error === "undefined") {
                console.info('Is_Runninglock_Type_Supported_Callback_test3_JSTest supported is ' + supported);
                expect(supported).assertTrue();
                console.info('Is_Runninglock_Type_Supported_Callback_test3_JSTest success');
                done();
            } else {
                console.log('Is_Runninglock_Type_Supported_Callback_test3_JSTest: ' + error);
                expect().assertFail();
                done();
            }
        })
    })
})
