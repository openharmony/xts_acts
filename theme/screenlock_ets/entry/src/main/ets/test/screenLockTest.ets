// @ts-nocheck
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, expect, it } from "hypium/index";

export default function screenLockJSUnit() {
    const INTERACTIVE_STATE_END_SLEEP = 0;
    const INTERACTIVE_STATE_USERID = 2;
    const INTERACTIVE_STATE_BEGIN_SLEEP = 3;
    const SLEEP_TIME = 1000;

    describe('ScreenLockServiceTest', function () {
        console.info("-----------------------ScreenlockTest is starting-----------------------");

        function sleep(numberMillis) {
            let now = new Date();
            let exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                return;
            }
        }

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0001
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0001", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0001-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0001 screen's status is " + data);
                    expect(data == true).assertTrue();
                });
            } catch (error) {
                console.info("logMessage SUB_MISC_THEME_screenLock_API_0001: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0001-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0002
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0002", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0002-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0002 screen's status is " + data);
                    expect(data == false).assertTrue();
                });
            } catch (error) {
                console.info("logMessage SUB_MISC_THEME_screenLock_API_0002: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0002-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0003
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0003", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0003-------------------");
            try {
                screenLock.isSecureMode((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0003 secureMode's result is " + data);
                    expect(data == false).assertTrue();
                });
            } catch (error) {
                console.info("logMessage SUB_MISC_THEME_screenLock_API_0003: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0003-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0004
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0004", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0004-------------------");
            try {
                screenLock.unlockScreen(() => {
                    console.info("SUB_MISC_THEME_screenLock_API_0004: send unlockScreen issue success");
                });

                sleep(SLEEP_TIME);
                let unlockScreenResult = 0;
                let eventType = 'unlockScreenResult';
                screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0004: sendScreenLockEvent result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0004: isScreenLocked result is " + data);
                    expect(data == false).assertTrue();
                });
            } catch (error) {
                console.info("SUB_MISC_THEME_screenLock_API_0004: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0004-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0005
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0005", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0005-------------------");
            try {
                screenLock.unlockScreen(() => {
                    console.info("SUB_MISC_THEME_screenLock_API_0005: send unlockScreen issue success");
                });

                sleep(SLEEP_TIME);
                let unlockScreenResult = 1;
                let eventType = 'unlockScreenResult';
                screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0005: sendScreenLockEvent result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0005: isScreenLocked result is " + data);
                    expect(data == true).assertTrue();
                });
            } catch (error) {
                console.info("logMessage SUB_MISC_THEME_screenLock_API_0005: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0005-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0006
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0006", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0006-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0006: isScreenLocked result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.unlockScreen(() => {
                    console.info("SUB_MISC_THEME_screenLock_API_0006: send unlockScreen issue success");
                });

                sleep(SLEEP_TIME);
                let unlockScreenResult = 0;
                let eventType = 'unlockScreenResult';
                screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0006: sendScreenLockEvent result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0006: isScreenLocked result is " + data);
                    expect(data == false).assertTrue();
                });
            } catch (error) {
                console.info("SUB_MISC_THEME_screenLock_API_0006: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0006-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0007
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0007", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0007-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0007: isScreenLocked is successful, result is " + data);
                    expect(data == false).assertTrue();
                });
            } catch (error) {
                console.info("logMessage SUB_MISC_THEME_screenLock_API_0007: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0007-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0008
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0008", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0008-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    console.log("SUB_MISC_THEME_screenLock_API_0008: isScreenLocked result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.unlockScreen(() => {
                    console.log("SUB_MISC_THEME_screenLock_API_0008: send unlockScreen issue success");
                });

                sleep(SLEEP_TIME);
                let unlockScreenResult = 1;
                let eventType = 'unlockScreenResult';
                screenLock.sendScreenLockEvent(eventType, unlockScreenResult, (err, data) => {
                    console.log("SUB_MISC_THEME_screenLock_API_0008: sendScreenLockEvent result is " + data);
                    expect(data == true).assertTrue();
                });

                sleep(SLEEP_TIME);
                screenLock.isScreenLocked((err, data) => {
                    console.log("SUB_MISC_THEME_screenLock_API_0008: isScreenLocked result is " + data);
                    expect(data == true).assertTrue();
                });
            } catch (error) {
                console.info("SUB_MISC_THEME_screenLock_API_0008: error = " + error);
                expect(true).assertTrue();
            }
            console.info("------------------end SUB_MISC_THEME_screenLock_API_0008-------------------");
            done();
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0009
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0009", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0009-------------------");
            let flag = null;
            try{
                flag = await screenLock.onSystemEvent((err, data) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0009 screenLock.onSystemEvent start");
                    if (err){
                        console.info("SUB_MISC_THEME_screenLock_API_0009 screenLock.onSystemEvent err: " + JSON.stringify(err));
                        expect().assertFalse();
                        done();
                    };
                    expect( data != null ).assertTrue();
                    console.info("SUB_MISC_THEME_screenLock_API_0009 screenLock.onSystemEvent end" + data)
                    done();
                });
                console.info("SUB_MISC_THEME_screenLock_API_0009 data: " + flag);
                expect( flag == true ).assertTrue();
            }catch(err){
                console.info("SUB_MISC_THEME_screenLock_API_0009 failed: " + JSON.stringify(err));
                done();
            }
            console.info("-----------------end SUB_MISC_THEME_screenLock_API_0009--------------------");
            done()
        });
    });
}
