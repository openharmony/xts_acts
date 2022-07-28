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

const SLEEP_TIME = 1000;

describe('ScreenLockServicePromiseTest', function () {
    console.info("-----------------------ScreenlockPromiseTest is starting-----------------------");

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
     * @tc.number  ScreenLock_Test_Promise_0100
     * @tc.name    Set to locked screen, query the lock screen state is locked state
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_Promise_0100", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_Promise_0100-------------------");
        var isScreenLocked = true;
        try {
            screenLock.isScreenLocked().then((data) => {
                console.info("ScreenLock_Test_Promise_0100 isScreenLocked result is " + data);
                expect(data == true).assertTrue()
            })
        } catch (error) {
            console.info("ScreenLock_Test_Promise_0100 test_setScreenLocked : error = " + error);
            expect(true).assertTrue();    
        }
        console.info("------------------end ScreenLock_Test_Promise_0100-------------------");
        done();
    });

    /*
     * @tc.number  ScreenLock_Test_Promise_0200
     * @tc.name    Set to unlocked screen, query the lock screen state is unlocked state
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_Promise_0200", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_Promise_0200-------------------");
        var isScreenLocked = false;
        try {
            screenLock.isScreenLocked().then((data) => {
                console.info("ScreenLock_Test_Promise_0200 isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("ScreenLock_Test_Promise_0200 test_setScreenLocked : error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_Promise_0200-------------------");
        done();
    });

    /*
     * @tc.number  ScreenLock_Test_Promise_0300
     * @tc.name    Query whether a password has been set, and return the password that has not been set
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_Promise_0300", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_Promise_0300-------------------");
        try {
            screenLock.isSecureMode().then((data) => {
                console.info("ScreenLock_Test_Promise_0300 isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("ScreenLock_Test_Promise_0300 isScreenLocked TRUE: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_Promise_0300-------------------");
        done();
    });

    /*
     * @tc.number  ScreenLock_Test_Promise_0400
     * @tc.name    Request to unlock the device screen, unlock successfully
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_Promise_0400", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_Promise_0400-------------------");
        try {
            screenLock.unlockScreen().then(() => {
                console.info("ScreenLock_Test_Promise_0400: send unlockScreen issue success");
            });
            sleep(SLEEP_TIME);
            var unlockScreenResult = 0;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult).then((data) => {
                console.info("ScreenLock_Test_Promise_0400: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });
            sleep(SLEEP_TIME);
            screenLock.isScreenLocked().then((data) => {
                console.info("ScreenLock_Test_Promise_0400: isScreenLocked result is " + data);
                expect(data == false).assertTrue();
            });
        } catch (error) {
            console.info("Screenlock_Test_1400: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_Promise_0400-------------------");
        done();
    });

    /*
     * @tc.number  ScreenLock_Test_Promise_0500
     * @tc.name    Request to unlock device screen, unlock failed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ScreenLock_Test_Promise_0500", 0, async function (done) {
        console.info("------------------start ScreenLock_Test_Promise_0500-------------------");
        try {
            screenLock.unlockScreen().then(() => {
                console.info("ScreenLock_Test_Promise_0500: send unlockScreen issue success");
            });

            sleep(SLEEP_TIME);
            var unlockScreenResult = 1;
            var eventType = 'unlockScreenResult';
            screenLock.sendScreenLockEvent(eventType, unlockScreenResult).then((data) => {
                console.info("ScreenLock_Test_Promise_0500: sendScreenLockEvent result is " + data);
                expect(data == true).assertTrue();
            });

            sleep(SLEEP_TIME);
            screenLock.isScreenLocked().then((data) => {
                console.info("ScreenLock_Test_Promise_0500: isScreenLocked result is " + data);
                expect(data == true).assertTrue();
                done();
            });
        } catch (error) {
            console.info("logMessage ScreenLock_Test_Promise_0500: error = " + error);
            expect(true).assertTrue();
        }
        console.info("------------------end ScreenLock_Test_Promise_0500-------------------");
        done();
    });

})