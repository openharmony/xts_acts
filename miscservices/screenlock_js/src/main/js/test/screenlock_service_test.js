// @ts-nocheck
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
import screenLock from '@ohos.app.screenlockability';
import {describe, expect, it} from 'deccjsunit/index'

const SCREEN_STATE_BEGIN_OFF = 0;
const SCREEN_STATE_END_OFF = 1;
const SCREEN_STATE_BEGIN_ON = 2;
const SCREEN_STATE_END_ON = 3;
const INTERACTIVE_STATE_END_SLEEP = 0;
const INTERACTIVE_STATE_BEGIN_WAKEUP = 1;
const INTERACTIVE_STATE_END_WAKEUP = 2;
const INTERACTIVE_STATE_BEGIN_SLEEP = 3;
const SLEEP_TIME = 1000;

describe('ScreenLockServiceTest', function () {
    console.log("-----------------------ScreenlockTest is starting-----------------------");

    function sleep(numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
            return;
        }
    }

    /*
     * @tc.number  ScreenLock_Test_0100
     * @tc.name    Set to locked screen, query the lock screen state is locked state
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_0100", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_0100-------------------");
        try {
            var isScreenLocked = true;
            screenLock.test_setScreenLocked(isScreenLocked, (err, data) => {
                console.log("ScreenLock_Test_0100 test_setScreenLocked data is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("ScreenLock_Test_0100 isScreenLocked's status is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage ScreenLock_Test_0100: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end ScreenLock_Test_0100-------------------");
    });

    /*
     * @tc.number  ScreenLock_Test_0200
     * @tc.name    Set to unlocked screen, query the lock screen state is unlocked state
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_0200", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_0200-------------------");
        try {
            var isScreenLocked = false;
            screenLock.test_setScreenLocked(isScreenLocked, (err, data) => {
                console.log("ScreenLock_Test_0200 test_setScreenLocked data is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("ScreenLock_Test_0200 isScreenLocked's status is " + data);
                expect(data == false).assertTrue();
            });

            var resetIsScreenLocked = true;
            screenLock.test_setScreenLocked(resetIsScreenLocked, (err, data) => {
                console.log("ScreenLock_Test_0200 test_setScreenLocked data is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage ScreenLock_Test_0200: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end ScreenLock_Test_0200-------------------");
    });

    /*
     * @tc.number  ScreenLock_Test_0300
     * @tc.name    Query whether a password has been set, and return the password that has not been set
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_0300", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_0300-------------------");
        try {
            screenLock.isSecureMode((err, data) => {
                console.log("ScreenLock_Test_0300 isSecureMode's result is " + data);
                expect(data == false).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage ScreenLock_Test_0300: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end ScreenLock_Test_0300-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_0400
     * @tc.name    Request to unlock the device screen, unlock successfully
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_0400", 0, async function (done) {
        console.info("------------------start Screenlock_Test_0400-------------------");
        try {
            var isScreenLocked = true;
            screenLock.test_setScreenLocked(isScreenLocked, (err, data) => {
                console.log("Screenlock_Test_0400: test_setScreenLocked setting " + data + " result is successfull");
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_0400: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 0;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.log("Screenlock_Test_0400: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0400: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.test_setScreenLocked(isScreenLocked, (err, data) => {
                console.log("Screenlock_Test_0400: test_setScreenLocked setting " + data + " result is successfull");
                done();
            });
        } catch (error) {
            console.info("Screenlock_Test_1400: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_0400-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_0500
     * @tc.name    Request to unlock device screen, unlock failed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_0500", 0, async function (done) {
        console.info("------------------start Screenlock_Test_0500-------------------");
        try {
            var isScreenLocked = true;
            screenLock.test_setScreenLocked(isScreenLocked, (err, data) => {
                console.log("Screenlock_Test_0500: test_setScreenLocked setting " + data + " result is successfull");
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_0500: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 1;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.log("Screenlock_Test_0500: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0500: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.info("logMessage Screenlock_Test_0500: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_0500-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2100
     * @tc.name    After the systemUI is started, it is in the locked state, the lock management sends
                   the unlock request successfully, and the lock screen application notifies the unlock
                   success message
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2100", 0, async function (done) {
        console.info("------------------start Screenlock_Test_2100-------------------");
        try {
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_2100: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_2100: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 0;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.log("Screenlock_Test_2100: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_2100: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });

            sleep(SLEEP_TIME);
            var isScreenLockedValue = true;
            screenLock.test_setScreenLocked(isScreenLockedValue, (err, data) => {
                console.log("Screenlock_Test_2100: test_setScreenLocked setting " + data + " result is successfull");
                done();
            });
        } catch (error) {
            console.info("Screenlock_Test_2100: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_2100-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2200
     * @tc.name    After systemUI is started, it is currently unlocked
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2200", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2200-------------------");
        try {
            var isScreenlockedValue = false;
            screenLock.test_setScreenLocked(isScreenlockedValue, (err, data) => {
                console.log("Screenlock_Test_2200: test_setScreenLocked is successful,result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_2200: isScreenLocked is successful, result is " + data);
                expect(data == false).assertTrue();
            });

            sleep(SLEEP_TIME);
            isScreenlockedValue = true;
            screenLock.test_setScreenLocked(isScreenlockedValue, (err, data) => {
                console.log("Screenlock_Test_2200: test_setScreenLocked is successful, result is " + data);
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2200: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end ScreenLock_Test_2200-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2300
     * @tc.name    After the systemUI is started, it is in the locked state, the lock management sends
                   the unlock request successfully, and the lock screen application notifies the unlock
                   failed message
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2300", 0, async function (done) {
        console.info("------------------start Screenlock_Test_2300-------------------");
        try {
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_2300: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_2300: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 1;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.log("Screenlock_Test_2300: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_2300: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.info("Screenlock_Test_2300: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_2300-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2400
     * @tc.name    Device management causes the screen to go off, and run "beginSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2400-------------------");
        try {
            var eventType = 'beginSleep';
            var reasonForSleep = 1;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_2400: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2400: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_BEGIN_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("end Screenlock_Test_2400: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2400-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2500
     * @tc.name    Device management causes the screen to go off, and run "endSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2500-------------------");
        try {
            var eventType = 'endSleep';
            var reasonForSleep = 1;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_2500: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2500: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_END_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2500: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2500-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2600
     * @tc.name    Device management causes the screen to go off, and run "beginScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2600", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2600-------------------");
        try {
            var eventType = 'beginScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_2600: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2600: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_BEGIN_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2600: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2600-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2700
     * @tc.name    Device management causes the screen to go off, and run "endScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2700", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2700-------------------");
        try {
            var eventType = 'endScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_2700: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2700: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_END_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2700: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2700-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2800
     * @tc.name    User causes the screen to go off, and run "beginSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2800", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2800-------------------");
        try {
            var eventType = 'beginSleep';
            var reasonForSleep = 2;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_2800: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2800: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_BEGIN_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2800: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2800-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_2900
     * @tc.name    User causes the screen to go off, and run "endSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2900", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2900-------------------");
        try {
            var eventType = 'endSleep';
            var reasonForSleep = 2;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_2900: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_2900: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_END_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_2900: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_2900-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3000
     * @tc.name    User causes the screen to go off, and run "beginScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3000", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3000-------------------");
        try {
            var eventType = 'beginScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3000: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3000: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_BEGIN_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3000: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3000-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3100
     * @tc.name    User causes the screen to go off, and run "endScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3100", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3100-------------------");
        try {
            var eventType = 'endScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3100: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3100: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_END_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3100: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3100-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3200
     * @tc.name    No operation for a long time causes the screen to go off, and run "beginSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3200", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3200-------------------");
        try {
            var eventType = 'beginSleep';
            var reasonForSleep = 3;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_3200: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3200: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_BEGIN_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3200: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3200-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3300
     * @tc.name    No operation for a long time causes the screen to go off, and run "endSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3300", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3300-------------------");
        try {
            var eventType = 'endSleep';
            var reasonForSleep = 3;
            screenLock.test_runtimeNotify(eventType, reasonForSleep, (err, data) => {
                console.log("Screenlock_Test_3300: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3300: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_END_SLEEP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3300: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3300-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3400
     * @tc.name    No operation for a long time causes the screen to go off, and run "beginScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3400-------------------");
        try {
            var eventType = 'beginScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3400: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3400: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_BEGIN_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3400: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3400-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3500
     * @tc.name    No operation for a long time causes the screen to go off, and run "endScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3500-------------------");
        try {
            var eventType = 'endScreenOff';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3500: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3500: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_END_OFF).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3500: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3500-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3600
     * @tc.name    Responding to bright screen events, and run "beginWakeUp" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3600", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3600-------------------");
        try {
            var eventType = 'beginWakeUp';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3600: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3600: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_BEGIN_WAKEUP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3600: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3600-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3700
     * @tc.name    Responding to bright screen events, and run "endWakeUp" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3700", 0, async function (done) {
        console.log("------------------logMessage Screenlock_Test_3700-------------------");
        try {
            var eventType = 'endWakeUp';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3700: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3700: test_getRuntimeState is successful, result is " + data);
                expect(data == INTERACTIVE_STATE_END_WAKEUP).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3700: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3700-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3800
     * @tc.name    Responding to bright screen events, and run "beginScreenOn" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3800", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3800-------------------");
        try {
            var eventType = 'beginScreenOn';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3800: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3800: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_BEGIN_ON).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3800: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3800-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_3900
     * @tc.name    Responding to bright screen events, and run "endScreenOn" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3900", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3900-------------------");
        try {
            var eventType = 'endScreenOn';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_3900: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_3900: test_getRuntimeState is successful, result is " + data);
                expect(data == SCREEN_STATE_END_ON).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_3900: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_3900-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4000
     * @tc.name    Modify the user ID to 2, and the modification is successful
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4000", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4000-------------------");
        try {
            var eventType = 'changeUser';
            var userId = 2;
            screenLock.test_runtimeNotify(eventType, userId, (err, data) => {
                console.log("Screenlock_Test_4000: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4000: test_getRuntimeState is successful, result is " + data);
                expect(data == userId).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4000: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4000-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4100
     * @tc.name    Modify the user ID to 0, and the modification is successful
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4100", 0, async function (done) {
        console.log("------------------logMessage Screenlock_Test_4100-------------------");
        try {
            var eventType = 'changeUser';
            var userId = 0;
            screenLock.test_runtimeNotify(eventType, userId, (err, data) => {
                console.log("Screenlock_Test_4100: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4100: test_getRuntimeState is successful, result is " + data);
                expect(data == userId).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4100: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4100-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4200
     * @tc.name    Modify the user ID to -3, and the modification is failed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4200", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4200-------------------");
        try {
            var eventType = 'changeUser';
            var userId = -3;
            screenLock.test_runtimeNotify(eventType, userId, (err, data) => {
                console.log("Screenlock_Test_4200: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            var oldUserId = 0;
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4200: test_getRuntimeState is successful, result is " + data);
                expect(data == oldUserId).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4200: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4200-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4300
     * @tc.name    Modify the user ID to 99999999999999, and the modification is failed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4300", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4300-------------------");
        try {
            var eventType = 'changeUser';
            var userId = 99999999999999;
            screenLock.test_runtimeNotify(eventType, userId, (err, data) => {
                console.log("Screenlock_Test_4300: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            var oldUserId = 0;
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4300: test_getRuntimeState is successful, result is" + data);
                expect(data == oldUserId).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4300: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4300-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4400
     * @tc.name    Modify the user ID to 'abc', and the modification is failed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4400-------------------");
        try {
            var eventType = 'changeUser';
            var userId = 'abc';
            screenLock.test_runtimeNotify(eventType, userId, (err, data) => {
                console.log("Screenlock_Test_4400: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            var oldUserId = 0;
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4400: test_getRuntimeState is successful, result is" + data);
                expect(data == oldUserId).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4400: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4400-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4500
     * @tc.name    Settings can lock the screen
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4500-------------------");
        try {
            var eventType = 'screenlockEnabled';
            var isScreenlockEnabled = 0;
            screenLock.test_runtimeNotify(eventType, isScreenlockEnabled, (err, data) => {
                console.log("Screenlock_Test_4500: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4500: test_getRuntimeState is successful, result is" + data);
                expect(data == isScreenlockEnabled).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4500: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4500-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4600
     * @tc.name    Setting can not lock screen
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4600", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4600-------------------");
        try {
            var eventType = 'screenlockEnabled';
            var isScreenlockEnabled = 1;
            screenLock.test_runtimeNotify(eventType, isScreenlockEnabled, (err, data) => {
                console.log("Screenlock_Test_4600: test_runtimeNotify is successful, result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4600: test_getRuntimeState is successful, result is" + data);
                expect(data == isScreenlockEnabled).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4600: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4600-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_4700
     * @tc.name    Run 'beginExitAnimation' operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4700", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4700-------------------");
        try {
            var eventType = 'beginExitAnimation';
            screenLock.test_runtimeNotify(eventType, -100, (err, data) => {
                console.log("Screenlock_Test_4700: test_runtimeNotify is successful, result is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4700: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_4700-------------------");
    });  
})