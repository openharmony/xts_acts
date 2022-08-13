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
import {describe, expect, it} from "hypium/index";

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
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0009-------------------");
          try {
              let eventType = 'beginWakeUp';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0009: test_getRuntimeState beginWakeUp is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0009: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0009-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0010
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0010", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0010-------------------");
          try {
              let eventType = 'endWakeUp';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0010: test_getRuntimeState endWakeUp is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0010: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0010-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0011
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0011", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0011-------------------");
          try {
              let eventType = 'beginScreenOn';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0011: test_getRuntimeState beginScreenOn is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0011: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0011-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0012
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0012", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0012-------------------");
          try {
              let eventType = 'beginScreenOn';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0012: test_getRuntimeState endScreenOn is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0012: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0012-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0013
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0013", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0013-------------------");
          try {
              let eventType = 'beginScreenOff';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0013: test_getRuntimeState beginScreenOff is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0013: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0013-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0014
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0014", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0014-------------------");
          try {
              let eventType = 'endScreenOff';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0014: test_getRuntimeState endScreenOff is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0014: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0014-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0015
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0015", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0015-------------------");
          try {
              let eventType = 'unlockScreen';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0015: test_getRuntimeState unlockScreen is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0015: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0015-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0016
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0016", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0016-------------------");
          try {
              let eventType = 'beginExitAnimation';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0016: test_getRuntimeState beginExitAnimation is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0016: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0016-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0017
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0017", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0017-------------------");
          try {
              let eventType = 'screenLockEnabled';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0017: test_getRuntimeState screenLockEnabled is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0017: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0017-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0018
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0018", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0018-------------------");
          try {
              let eventType = 'beginSleep';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0018: test_getRuntimeState beginSleep is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0018: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0018-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0019
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0019", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0019-------------------");
          try {
              let eventType = 'endSleep';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0019: test_getRuntimeState endSleep is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0019: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0019-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0020
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0020", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0020-------------------");
          try {
              let eventType = 'changeUser';
              screenLock.off(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0020: test_getRuntimeState changeUser is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0020: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0020-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0021
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0021", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0021-------------------");
          try {
              let eventType = 'beginWakeUp';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0021: test_getRuntimeState beginWakeUp is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0021: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0021-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0022
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0022", 0, async function (done) {
          console.log("------------------logMessage SUB_MISC_THEME_screenLock_API_0022-------------------");
          try {
              let eventType = 'endWakeUp';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0022: test_getRuntimeState endWakeUp is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0022: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0022-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0023
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0023", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0023-------------------");
          try {
              let eventType = 'beginScreenOn';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0023: test_getRuntimeState beginScreenOn is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0023: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0023-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0024
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0024", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0024-------------------");
          try {
              let eventType = 'endScreenOn';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0024: test_getRuntimeState endScreenOn is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0024: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0024-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0025
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0025", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0025-------------------");
          try {
              let eventType = 'beginScreenOff';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0025: test_getRuntimeState beginScreenOff is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0025: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0025-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0026
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0026", 0, async function (done) {
          console.log("------------------logMessage SUB_MISC_THEME_screenLock_API_0026-------------------");
          try {
              let eventType = 'endScreenOff';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0026: test_getRuntimeState endScreenOff is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0026: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0026-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0027
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0027", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0027-------------------");
          try {
              let eventType = 'unlockScreen';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0027: test_getRuntimeState unlockScreen is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0027: error = " + error);
              expect(true).assertTrue();
          }
        console.log("------------------end SUB_MISC_THEME_screenLock_API_0027-------------------");
        done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0028
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0028", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0028-------------------");
          try {
              let eventType = 'beginExitAnimation';
              screenLock.on(eventType, () => {
                  console.log("SUB_MISC_THEME_screenLock_API_0028: test_getRuntimeState beginExitAnimation is successful" );
              });
          } catch (error) {
              console.log("end SUB_MISC_THEME_screenLock_API_0028: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0028-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0029
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0029", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0029-------------------");
          try {
              let eventType = 'changeUser';
              screenLock.on(eventType, (err, data) => {
                  console.log("SUB_MISC_THEME_screenLock_API_0029: test_getRuntimeState beginSleep is successful");
                  expect(data == INTERACTIVE_STATE_BEGIN_SLEEP).assertTrue();
              });
          } catch (error) {
              console.log("logMessage SUB_MISC_THEME_screenLock_API_0029: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0029-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0030
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0030", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0030-------------------");
          try {
              let eventType = 'endSleep';
              screenLock.test_getRuntimeState(eventType, (err, data) => {
                  console.log("SUB_MISC_THEME_screenLock_API_0030: test_getRuntimeState endSleep is successful");
                  expect(data == INTERACTIVE_STATE_END_SLEEP).assertTrue();
              });
          } catch (error) {
              console.log("logMessage SUB_MISC_THEME_screenLock_API_0030: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0030-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0031
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0031", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0031-------------------");
          try {
              let eventType = 'changeUser';
              screenLock.test_getRuntimeState(eventType, (err, data) => {
                  console.log("SUB_MISC_THEME_screenLock_API_0031: test_getRuntimeState changeUser is successful");
                  expect(data == INTERACTIVE_STATE_USERID).assertTrue();
              });
          } catch (error) {
              console.log("logMessage SUB_MISC_THEME_screenLock_API_0031: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0031-------------------");
          done();
      });

      /*
       * @tc.number    SUB_MISC_THEME_screenLock_API_0032
       * @tc.name      Set to locked screen, query the lock screen state is locked state
       * @tc.desc      Test ScreenLock API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it("SUB_MISC_THEME_screenLock_API_0032", 0, async function (done) {
          console.log("------------------start SUB_MISC_THEME_screenLock_API_0032-------------------");
          try {
              let eventType = 'screenLockEnabled';
              screenLock.test_getRuntimeState(eventType, (err, data) => {
                  console.log("SUB_MISC_THEME_screenLock_API_0032: test_getRuntimeState screenLockEnabled is successfuls");
                  expect(data == true).assertTrue();
              });
          } catch (error) {
              console.log("logMessage SUB_MISC_THEME_screenLock_API_0032: error = " + error);
              expect(true).assertTrue();
          }
          console.log("------------------end SUB_MISC_THEME_screenLock_API_0032-------------------");
          done();
      });
  })
}
