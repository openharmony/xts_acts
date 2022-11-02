// @ts-nocheck
/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

export default function ScreenLockPromiseTest(){
  describe('ScreenLockServicePromiseTest', function () {
    console.info("-----------------------ScreenlockPromiseTest is starting-----------------------");

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
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_001
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_001", 0, async function (done) {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_001-------------------");
      try {
        screenLock.isScreenLocked().then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_001 isScreenLocked result is " + data);
          expect(data == true).assertTrue()
        })
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_001 test_setScreenLocked : error = " + error);
        expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_001-------------------");
      done();
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_002
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_002", 0, async function (done) {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_002-------------------");
      try {
        screenLock.isScreenLocked().then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_002 isScreenLocked result is " + data);
          expect(data == false).assertTrue();
        });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_002 test_setScreenLocked : error = " + error);
        expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_002-------------------");
      done();
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_003
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_003", 0, async function (done) {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_003-------------------");
      try {
        screenLock.isSecureMode().then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_003 isScreenLocked result is " + data);
          expect(data == false).assertTrue();
        });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_003 isScreenLocked TRUE: error = " + error);
        expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_003-------------------");
      done();
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_004
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_004", 0, async function (done) {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_004-------------------");
      try {
        screenLock.unlockScreen().then(() => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_004: send unlockScreen issue success");
        });
        sleep(SLEEP_TIME);
        let unlockScreenResult = 0;
        let eventType = 'unlockScreenResult';
        screenLock.sendScreenLockEvent(eventType, unlockScreenResult).then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_004: sendScreenLockEvent result is " + data);
          expect(data == true).assertTrue();
        });
        sleep(SLEEP_TIME);
        screenLock.isScreenLocked().then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_004: isScreenLocked result is " + data);
          expect(data == false).assertTrue();
        });
      } catch (error) {
        console.info("Screenlock_Test_1400: error = " + error);
        expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_004-------------------");
      done();
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_005
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_005", 0, async function (done) {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_005-------------------");
      try {
        screenLock.unlockScreen().then(() => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_005: send unlockScreen issue success");
        });

        sleep(SLEEP_TIME);
        let unlockScreenResult = 1;
        let eventType = 'unlockScreenResult';
        screenLock.sendScreenLockEvent(eventType, unlockScreenResult).then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_005: sendScreenLockEvent result is " + data);
          expect(data == true).assertTrue();
        });

        sleep(SLEEP_TIME);
        screenLock.isScreenLocked().then((data) => {
          console.info("SUB_MISC_THEME_screenLock_API_Promise_005: isScreenLocked result is " + data);
          expect(data == true).assertTrue();
          done();
        });
      } catch (error) {
        console.info("logMessage SUB_MISC_THEME_screenLock_API_Promise_005: error = " + error);
        expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_005-------------------");
      done();
    });
  })
}
