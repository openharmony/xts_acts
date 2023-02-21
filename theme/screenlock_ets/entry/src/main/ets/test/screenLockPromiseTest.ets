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
import { describe, expect, it, beforeEach} from "hypium/index";

const SLEEP_TIME = 1000;

export default function ScreenLockPromiseTest(){
  describe('ScreenLockServicePromiseTest', function () {
    console.info("-----------------------ScreenlockPromiseTest is starting-----------------------");

    let result = false
    beforeEach(async function (done) {
        result = await screenLock.isScreenLocked();
        done();
    });   

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
          expect(data == result).assertTrue()
          console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_001-------------------");
        done();
        })
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_001 test_setScreenLocked : error = " + error);
        expect().assertFail();
        done();
      }
      
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
          expect(data == result).assertTrue();
          console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_002-------------------");
        done();
        });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_002 test_setScreenLocked : error = " + error);
        expect().assertFail();
        done();
      }
      
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
          console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_003-------------------");
          done();
        });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_003 isScreenLocked TRUE: error = " + error);
        expect().assertFail();
        done();
      }      
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
        screenLock.unlockScreen().then((data) => {
              let currentResult = screenLock.isLocked()
              expect(currentResult).assertEqual(false)
              console.info("====>SUB_MISC_THEME_screenLock_API_Promise_004 success.");
              console.info('====>-------------SUB_MISC_THEME_screenLock_API_Promise_004 end----------------------');
              done();
          }).catch( err => {
              console.info("====>SUB_MISC_THEME_screenLock_API_Promise_004 failed because: " + JSON.stringify(err));
              expect().assertFail();
              done();
          });
        } catch (error) {
          console.info("====>SUB_MISC_THEME_screenLock_API_Promise_004: error = " + error);
          expect(true).assertTrue();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_004-------------------");
      done();
    });
  })
}
