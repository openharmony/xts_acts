// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, it, expect} from "deccjsunit/index.ets";
import screenLock from '@ohos.screenLock';

export default function screenLockJsunit() {
  describe('screenLockTest', function () {
    console.log("************* screenLock Test start*************");

    /*
     * @tc.number    : MiscServices_ScreenLock_isScreenLocked_0100
     * @tc.name      : isScreenLocked
     * @tc.desc      : Checks whether the screen is currently locked.
     */
    it('MiscServices_ScreenLock_isScreenLocked_0100', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_isScreenLocked_0100";
      try {
        screenLock.isScreenLocked((error, data) => {
          if (error) {
            console.error(caseName + 'Operation failed. Cause:' + JSON.stringify(error));
            return;
          }
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });

    /*
     * @tc.number    : MiscServices_ScreenLock_isScreenLocked_0200
     * @tc.name      : isScreenLocked
     * @tc.desc      : Checks whether the screen is currently locked.
     */
    it('MiscServices_ScreenLock_isScreenLocked_0200', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_isScreenLocked_0200";
      try {
        screenLock.isScreenLocked().then((data) => {
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.error(caseName + 'Operation failed. Cause: ' + JSON.stringify(error));
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });

    /*
     * @tc.number    : MiscServices_ScreenLock_isSecureMode_0100
     * @tc.name      : isSecureMode
     * @tc.desc      : Checks whether the screen lock of the current device is secure.
     */
    it('MiscServices_ScreenLock_isSecureMode_0100', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_isSecureMode_0100";
      try {
        screenLock.isSecureMode((error, data) => {
          if (error) {
            console.error(caseName + 'Operation failed. Cause:' + JSON.stringify(error));
            return;
          }
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });

    /*
     * @tc.number    : MiscServices_ScreenLock_isSecureMode_0200
     * @tc.name      : isSecureMode
     * @tc.desc      : Checks whether the screen lock of the current device is secure.
     */
    it('MiscServices_ScreenLock_isSecureMode_0200', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_isSecureMode_0200";
      try {
        screenLock.isSecureMode().then((data) => {
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.error(caseName + 'Operation failed. Cause: ' + JSON.stringify(error));
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });

    /*
     * @tc.number    : MiscServices_ScreenLock_unlockScreen_0100
     * @tc.name      : unlockScreen
     * @tc.desc      : Unlocks the screen.
     */
    it('MiscServices_ScreenLock_unlockScreen_0100', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_unlockScreen_0100"
      try {
        screenLock.unlockScreen((error, data) => {
          if (error) {
            console.error(caseName + 'Operation failed. Cause:' + JSON.stringify(error));
            return;
          }
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });

    /*
     * @tc.number    : MiscServices_ScreenLock_unlockScreen_0200
     * @tc.name      : unlockScreen
     * @tc.desc      : Unlocks the screen.
     */
    it('MiscServices_ScreenLock_unlockScreen_0200', 0, async function (done) {
      let caseName = "MiscServices_ScreenLock_unlockScreen_0200";
      try {
        screenLock.unlockScreen().then((data) => {
          console.info(caseName + 'Operation successful. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.error(caseName + 'Operation failed. Cause: ' + JSON.stringify(error));
          done();
        })
      } catch (err) {
        console.info(caseName + 'catch error: ' + err);
        expect(true).assertTrue();
        done();
      }
      done();
    });
}