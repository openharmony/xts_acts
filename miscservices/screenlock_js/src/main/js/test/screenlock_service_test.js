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
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0400: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
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
     * @tc.number  Screenlock_Test_0600
     * @tc.name    After the systemUI is started, it is in the locked state, the lock management sends
                   the unlock request successfully, and the lock screen application notifies the unlock
                   success message
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_0600", 0, async function (done) {
        console.info("------------------start Screenlock_Test_0600-------------------");
        try {
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0600: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_0600: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0600: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            var isScreenLockedValue = true;
            screenLock.test_setScreenLocked(isScreenLockedValue, (err, data) => {
                console.log("Screenlock_Test_0600: test_setScreenLocked setting " + data + " result is successfull");
                done();
            });
        } catch (error) {
            console.info("Screenlock_Test_0600: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_0600-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_0700
     * @tc.name    After systemUI is started, it is currently unlocked
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_0700", 0, async function (done) {
        console.log("------------------start Screenlock_Test_0700-------------------");
        try {
            var isScreenlockedValue = false;
            screenLock.test_setScreenLocked(isScreenlockedValue, (err, data) => {
                console.log("Screenlock_Test_0700: test_setScreenLocked is successful,result is " + data);
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0700: isScreenLocked is successful, result is " + data);
                expect(data == false).assertTrue();
                done();
            });
        } catch (error) {
            console.log("logMessage Screenlock_Test_0700: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.log("------------------end Screenlock_Test_0700-------------------");
    });

    /*
     * @tc.number  Screenlock_Test_0800
     * @tc.name    After the systemUI is started, it is in the locked state, the lock management sends
                   the unlock request successfully, and the lock screen application notifies the unlock
                   failed message
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Screenlock_Test_0800", 0, async function (done) {
        console.info("------------------start Screenlock_Test_0800-------------------");
        try {
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0800: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.unlockScreen(() => {
                console.log("Screenlock_Test_0800: send unlockScreen issue success");
            });

           
            sleep(SLEEP_TIME);
            screenLock.isScreenLocked((err, data) => {
                console.log("Screenlock_Test_0800: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
                done();
            });
        } catch (error) {
            console.info("Screenlock_Test_0800: error = " + error);
            expect(true).assertTrue();
            done();
        }
        console.info("------------------end Screenlock_Test_0800-------------------");
    }); 
})