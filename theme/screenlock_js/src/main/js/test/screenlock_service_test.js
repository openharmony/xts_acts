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
import screenLock from '@ohos.screenLock';
import {describe, expect, it} from 'deccjsunit/index'

const INTERACTIVE_STATE_END_SLEEP = 0;
const INTERACTIVE_STATE_USERID = 2;
const INTERACTIVE_STATE_BEGIN_SLEEP = 3;
const SLEEP_TIME = 1000;

describe('ScreenLockServiceTest', function () {
    console.info("-----------------------ScreenlockTest is starting-----------------------");

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
            screenLock.isScreenLocked((err, data) => {
                console.info("ScreenLock_Test_0100 isScreenLocked's status is " + data);
                expect(data == true).assertTrue();
            });
        } catch (error) {
            console.info("logMessage ScreenLock_Test_0100: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_0100-------------------");
        done();
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
            screenLock.isScreenLocked((err, data) => {
                console.info("ScreenLock_Test_0200 isScreenLocked's status is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("logMessage ScreenLock_Test_0200: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_0200-------------------");
        done();
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
                console.info("ScreenLock_Test_0300 isSecureMode's result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("logMessage ScreenLock_Test_0300: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_0300-------------------");
        done();
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
            screenLock.unlockScreen(() => {
                console.info("Screenlock_Test_0400: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 0;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.info("Screenlock_Test_0400: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.info("Screenlock_Test_0400: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("Screenlock_Test_1400: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end Screenlock_Test_0400-------------------");
        done();
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
            screenLock.unlockScreen(() => {
                console.info("Screenlock_Test_0500: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 1;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.info("Screenlock_Test_0500: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.info("Screenlock_Test_0500: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });
        } catch (error) {
            console.info("logMessage Screenlock_Test_0500: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end Screenlock_Test_0500-------------------");
        done();
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
                console.info("Screenlock_Test_2100: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.info("Screenlock_Test_2100: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 0;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                console.info("Screenlock_Test_2100: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.info("Screenlock_Test_2100: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("Screenlock_Test_2100: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end Screenlock_Test_2100-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2200
     * @tc.name    After systemUI is started, it is currently unlocked
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2200", 0, async function (done) {
        console.info("------------------start Screenlock_Test_2200-------------------");
        try {
            screenLock.isScreenLocked((err, data) => {
                console.info("Screenlock_Test_2200: isScreenLocked is successful, result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("logMessage Screenlock_Test_2200: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_2200-------------------");
        done();
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
            });
        } catch (error) {
            console.info("Screenlock_Test_2300: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end Screenlock_Test_2300-------------------");
        done();
    });

   
    /*
     * @tc.number  Screenlock_Test_2400
     * @tc.name    Device management causes the screen to go off, and run "beginWakeUp" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2400-------------------");
        try {
            var eventType = 'beginWakeUp';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2400: test_getRuntimeState beginWakeUp is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2400: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2400-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2500
     * @tc.name    Device management causes the screen to go off, and run "endWakeUp" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2500-------------------");
        try {
            var eventType = 'endWakeUp';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2500: test_getRuntimeState endWakeUp is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2500: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2500-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2600
     * @tc.name    Device management causes the screen to go off, and run "beginScreenOn" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2600", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2600-------------------");
        try {
            var eventType = 'beginScreenOn';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2600: test_getRuntimeState beginScreenOn is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2600: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2600-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2700
     * @tc.name    Device management causes the screen to go off, and run "endScreenOn" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2700", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2700-------------------");
        try {
            var eventType = 'beginScreenOn';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2700: test_getRuntimeState endScreenOn is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2700: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2700-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2800
     * @tc.name    User causes the screen to go off, and run "beginScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2800", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2800-------------------");
        try {
            var eventType = 'beginScreenOff';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2800: test_getRuntimeState beginScreenOff is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2800: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2800-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_2900
     * @tc.name    User causes the screen to go off, and run "endScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_2900", 0, async function (done) {
        console.log("------------------start Screenlock_Test_2900-------------------");
        try {
            var eventType = 'endScreenOff';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_2900: test_getRuntimeState endScreenOff is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_2900: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_2900-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3000
     * @tc.name    User causes the screen to go off, and run "unlockScreen" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3000", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3000-------------------");
        try {
            var eventType = 'unlockScreen';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3000: test_getRuntimeState unlockScreen is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3000: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3000-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3100
     * @tc.name    User causes the screen to go off, and run "beginExitAnimation" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3100", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3100-------------------");
        try {
            var eventType = 'beginExitAnimation';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3100: test_getRuntimeState beginExitAnimation is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3100: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3100-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3200
     * @tc.name    No operation for a long time causes the screen to go off, and run "screenlockEnabled" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3200", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3200-------------------");
        try {
            var eventType = 'screenlockEnabled';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3200: test_getRuntimeState screenlockEnabled is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3200: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3200-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3300
     * @tc.name    No operation for a long time causes the screen to go off, and run "beginSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3300", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3300-------------------");
        try {
            var eventType = 'beginSleep';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3300: test_getRuntimeState beginSleep is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3300: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3300-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3400
     * @tc.name    No operation for a long time causes the screen to go off, and run "endSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3400-------------------");
        try {
            var eventType = 'endSleep';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3400: test_getRuntimeState endSleep is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3400: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3400-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_3500
     * @tc.name    No operation for a long time causes the screen to go off, and run "changeUser" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_3500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_3500-------------------");
        try {
            var eventType = 'changeUser';
            screenLock.off(eventType, () => {
                console.log("Screenlock_Test_3500: test_getRuntimeState changeUser is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3500: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3500-------------------");
        done();
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
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_3600: test_getRuntimeState beginWakeUp is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3600: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3600-------------------");
        done();
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
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_3700: test_getRuntimeState endWakeUp is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3700: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3700-------------------");
        done();
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
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_3800: test_getRuntimeState beginScreenOn is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3800: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3800-------------------");
        done();
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
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_3900: test_getRuntimeState endScreenOn is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_3900: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_3900-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4000
     * @tc.name    Responding to bright screen events, and run "beginScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4000", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4000-------------------");
        try {
            var eventType = 'beginScreenOff';
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_4000: test_getRuntimeState beginScreenOff is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_4000: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4000-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4100
     * @tc.name    Responding to bright screen events, and run "endScreenOff" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4100", 0, async function (done) {
        console.log("------------------logMessage Screenlock_Test_4100-------------------");
        try {
            var eventType = 'endScreenOff';
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_4100: test_getRuntimeState endScreenOff is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_4100: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4100-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4200
     * @tc.name    Responding to bright screen events, and run "unlockScreen" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4200", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4200-------------------");
        try {
            var eventType = 'unlockScreen';
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_4200: test_getRuntimeState unlockScreen is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_4200: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4200-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4300
     * @tc.name    Responding to bright screen events, and run "beginExitAnimation" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4300", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4300-------------------");
        try {
            var eventType = 'beginExitAnimation';
            screenLock.on(eventType, () => {
                console.log("Screenlock_Test_4300: test_getRuntimeState beginExitAnimation is successful" );
            });
        } catch (error) {
            console.log("end Screenlock_Test_4300: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4300-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4400
     * @tc.name    Responding to bright screen events, and run "beginSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4400", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4400-------------------");
        try {
            var eventType = 'changeUser';
            screenLock.on(eventType, (err, data) => {
                console.log("Screenlock_Test_4400: test_getRuntimeState beginSleep is successful");
                expect(data == INTERACTIVE_STATE_BEGIN_SLEEP).assertTrue();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4400: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4400-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4500
     * @tc.name    Responding to bright screen events, and run "endSleep" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4500", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4500-------------------");
        try {
            var eventType = 'endSleep';
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4500: test_getRuntimeState endSleep is successful");
                expect(data == INTERACTIVE_STATE_END_SLEEP).assertTrue();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4500: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4500-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4600
     * @tc.name    Responding to bright screen events, and run "changeUser" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4600", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4600-------------------");
        try {
            var eventType = 'changeUser';
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4600: test_getRuntimeState changeUser is successfuls");
                expect(data == INTERACTIVE_STATE_USERID).assertTrue();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4600: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4600-------------------");
        done();
    });

    /*
     * @tc.number  Screenlock_Test_4700
     * @tc.name    Responding to bright screen events, and run "screenlockEnabled" operate
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_4700", 0, async function (done) {
        console.log("------------------start Screenlock_Test_4700-------------------");
        try {
            var eventType = 'screenlockEnabled';
            screenLock.test_getRuntimeState(eventType, (err, data) => {
                console.log("Screenlock_Test_4700: test_getRuntimeState screenlockEnabled is successfuls");
                expect(data == true).assertTrue();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_4700: error = " + error);
            expect(true).assertTrue();
        }
        console.log("------------------end Screenlock_Test_4700-------------------");
        done();
    });
})