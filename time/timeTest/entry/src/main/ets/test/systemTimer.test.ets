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

import WantAgent from '@ohos.wantAgent';
import systemTimer from "@ohos.systemTimer";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function systemTimerTest() {
  describe('systemTimerTest', function () {
    console.info('systemTimer Test start');
    //wantAgent对象
    var wantAgent;

    //WantAgentInfo对象
    let wantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.time.test",
          abilityName: "MainAbility"
        }
      ],
      operationType: WantAgent.OperationType.SEND_COMMON_EVENT,
      requestCode: 0,
      wantAgentFlags:[WantAgent.WantAgentFlags.NO_BUILD_FLAG]
    }

    let interval_time = 5000;
    let globalTimerID = undefined;

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('beforeAll: Prerequisites are executed.');
      WantAgent.getWantAgent(wantAgentInfo)
        .then((data) => {
          if ( data != undefined || data != null) {
            console.info('beforeAll: success to get wantAgent: ' + typeof(data));
            wantAgent = data;
          }
        })
        .catch(error => {
          console.error('beforeAll: failed to get wantAgent!');
        });
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('afterAll: Test suite-level cleanup condition is executed.');
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0000
     * @tc.name SUB_time_systemTimer_createTimer_0000
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimer_0000', 0, async function (done) {
      console.info('SUB_time_systemTimer_createTimer_0000 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      try {
        console.info('SUB_time_systemTimer_createTimer_0000 create timer.');
        systemTimer.createTimer(options, function (err, timerID) {
          if (err) {
            // 处理业务逻辑错误
            expect().assertTrue();
            done();
          }
          console.info('SUB_time_systemTimer_createTimer_0000 timerID: ' + timerID);
          globalTimerID = timerID;
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_createTimer_0000 has failed for ' + err);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0001
     * @tc.name SUB_time_systemTimer_createTimer_0001
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = true (callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimer_0001', 0, async function (done) {
      console.info('SUB_time_systemTimer_createTimer_0001 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_IDLE,
        repeat: false
      };
      try {
        systemTimer.createTimer(options, function (err, timerID) {
          if (err) {
            console.info('SUB_time_systemTimer_createTimer_0001 wrong since ' + err.code);
            expect().assertTrue();
            done();
          };
          console.info('SUB_time_systemTimer_createTimer_0001 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0001 arv wrong since ' + e.code);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0002
     * @tc.name SUB_time_systemTimer_createTimer_0002
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0002', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0002 start");
      WantAgent.getBundleName(wantAgent, (err, data)=>{
        console.info('SUB_time_systemTimer_createTimer_0002 BundleName: ' + data);
      })
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0002 create timer")
        systemTimer.createTimer(options, function (err, timerID) {
          if (err) {
            console.info('SUB_time_systemTimer_createTimer_0002 wrong since ' + err.code);
            expect().assertTrue();
            done();
          }
          console.info('SUB_time_systemTimer_createTimer_0002 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0002 arv wrong since ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0003
     * @tc.name SUB_time_systemTimer_createTimer_0003
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0003', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0003 start");
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0003 create timer")
        systemTimer.createTimer(options, function (err, timerID) {
          if (err) {
            console.info('SUB_time_systemTimer_createTimer_0003 wrong since ' + err.code);
            expect().assertTrue();
            done();
          }
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0002 arv wrong since ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0004
     * @tc.name SUB_time_systemTimer_createTimer_0004
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false, wantAgent(callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0004', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0004 start");
      WantAgent.getBundleName(wantAgent, (err, data)=>{
        console.info("SUB_time_systemTimer_createTimer_0004 BundleName: " + data);
      });
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0004 create timer")
        systemTimer.createTimer(options, function (err, timerID) {
          if (err) {
            expect().assertTrue();
            done();
          };
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0004 has failed for ' + e);
        expect().assertTrue();
        done();
      };
    });


    /**
     * @tc.number SUB_time_systemTimer_createTimer_0005
     * @tc.name SUB_time_systemTimer_createTimer_0005
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimer_0005', 0, async function (done) {
      console.info('SUB_time_systemTimer_createTimer_0005 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      try {
        console.info('SUB_time_systemTimer_createTimer_0005 create timer.');
        systemTimer.createTimer(options).then((timerID) =>{
          console.info('SUB_time_systemTimer_createTimer_0005 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        }).catch(err => {
          console.info('SUB_time_systemTimer_createTimer_0005 promise failed ' + err);
          expect().assertTrue();
          done();
        });
      } catch (err) {
        console.info('SUB_time_systemTimer_createTimer_0005 has failed for ' + err);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0006
     * @tc.name SUB_time_systemTimer_createTimer_0006
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_IDLE, repeat = true (callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimer_0006', 0, async function (done) {
      console.info('SUB_time_systemTimer_createTimer_0006 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_IDLE,
        repeat: false
      };
      try {
        systemTimer.createTimer(options).then((timerID) => {
          console.info('SUB_time_systemTimer_createTimer_0006 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        }).catch(err => {
          console.info('SUB_time_systemTimer_createTimer_0006 promise failed ' + err);
          expect().assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0006 arv wrong since ' + e.code);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0007
     * @tc.name SUB_time_systemTimer_createTimer_0007
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = true, interval (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0007', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0007 start");
      WantAgent.getBundleName(wantAgent, (err, data)=>{
        console.info('SUB_time_systemTimer_createTimer_0007 BundleName: ' + data);
      })
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0007 create timer");
        systemTimer.createTimer(options).then((timerID) => {
          console.info('SUB_time_systemTimer_createTimer_0007 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        }).catch(err => {
          console.info('SUB_time_systemTimer_createTimer_0007 promise failed ' + err);
          expect().assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0007 arv wrong since ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0008
     * @tc.name SUB_time_systemTimer_createTimer_0008
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_EXACT, repeat = false (Callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0008', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0008 start");
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0008 create timer")
        systemTimer.createTimer(options).then((timerID) => {
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        }).catch(err => {
          console.info('SUB_time_systemTimer_createTimer_0008 promise failed ' + err);
          expect().assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0008 arv wrong since ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0009
     * @tc.name SUB_time_systemTimer_createTimer_0009
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false, wantAgent(callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_time_systemTimer_createTimer_0009', 2, async function (done) {
      console.info("SUB_time_systemTimer_createTimer_0009 start");
      WantAgent.getBundleName(wantAgent, (err, data)=>{
        console.info("SUB_time_systemTimer_createTimer_0009 BundleName: " + data);
      });
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      try {
        console.info("SUB_time_systemTimer_createTimer_0009 create timer")
        systemTimer.createTimer(options).then((timerID) => {
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        }).catch(err => {
          console.info('SUB_time_systemTimer_createTimer_0009 promise failed ' + err);
          expect().assertTrue();
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_createTimer_0009 has failed for ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_startTimer_0001
     * @tc.name SUB_time_systemTimer_startTimer_0001
     * @tc.desc Test startTimer() interfaces, normal call(callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_startTimer_0001', 0, async function (done) {
      console.info("SUB_time_systemTimer_startTimer_0001 start");
      try {
        console.info("SUB_time_systemTimer_startTimer_0001 start timer, timerID: " + globalTimerID)
        let triggerTime = new Date().getTime() + interval_time * 1.2;
        systemTimer.startTimer(globalTimerID, triggerTime, function (err, data) {
          if (err) {
            console.info('SUB_time_systemTimer_startTimer_0001 wrong since ' + err.code);
            expect().assertTrue();
            done();
          }
          console.info("SUB_time_systemTimer_startTimer_0001 success to start timerID: " + globalTimerID);
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_startTimer_0001 has failed for ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_stopTimer_0001
     * @tc.name SUB_time_systemTimer_stopTimer_0001
     * @tc.desc Test startTimer() interfaces, normal call(callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_stopTimer_0001', 0, async function (done) {
      console.info("SUB_time_systemTimer_stopTimer_0001 start");
      try {
        console.info("SUB_time_systemTimer_stopTimer_0001 stop timer, timerID: " + globalTimerID)
        systemTimer.stopTimer(globalTimerID, function (err, data) {
          if (err) {
            expect().assertTrue();
            done();
          };
          console.info("SUB_time_systemTimer_stopTimer_0001 success to stop timerID: " + globalTimerID);
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_stopTimer_0001 has failed for ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_destroyTimer_0001
     * @tc.name SUB_time_systemTimer_destroyTimer_0001
     * @tc.desc Test startTimer() interfaces, normal call(callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_destroyTimer_0001', 0, async function (done) {
      console.info("SUB_time_systemTimer_destroyTimer_0001 start");
      try {
        console.info("SUB_time_systemTimer_destroyTimer_0001 destroy timer, timerID: " + globalTimerID)
        systemTimer.destroyTimer(globalTimerID, function (err, data) {
          if (err) {
            expect().assertTrue();
            done();
          };
          console.info("SUB_time_systemTimer_destroyTimer_0001 success to destroy timerID: " + globalTimerID);
          done();
        });
      } catch (e) {
        console.info('SUB_time_systemTimer_destroyTimer_0001 has failed for ' + e);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimer_0002
     * @tc.name SUB_time_systemTimer_createTimer_0002
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimer_0002', 0, async function (done) {
      console.info('SUB_time_systemTimer_createTimer_0002 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      try {
        console.info('SUB_time_systemTimer_createTimer_0002 create timer.');
        systemTimer.createTimer(options).then((timerID)=>{
          console.info('SUB_time_systemTimer_createTimer_0002 timerID:' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          globalTimerID = timerID;
          done();
        }).catch( error => {
          // 捕获业务逻辑错误
          console.info('SUB_time_systemTimer_createTimer_0002 failed to create timer.');
          expect().assertTrue();
          done();
        });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_createTimer_0002 has failed for ' + err);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_startTimer_0002
     * @tc.name SUB_time_systemTimer_startTimer_0002
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = true (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_startTimer_0002', 0, async function (done) {
      console.info('SUB_time_systemTimer_startTimer_0002 start.');
      try {
        console.info('SUB_time_systemTimer_startTimer_0002 start timer, timerID: ' + globalTimerID);
        let triggerTime = new Date().getTime() + interval_time * 2;
        systemTimer.startTimer(globalTimerID, triggerTime)
          .then(()=>{
            console.info('SUB_time_systemTimer_startTimer_0002 timerID:' + globalTimerID);
            done();
          }).catch(()=>{
          // 捕获业务逻辑错误
          console.info('SUB_time_systemTimer_startTimer_0002 failed to start timer.');
          expect().assertTrue();
          done();
        });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_startTimer_0002 has failed for ' + err);
        expect().assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_time_systemTimer_stopTimer_0002
     * @tc.name SUB_time_systemTimer_stopTimer_0002
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = true (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_stopTimer_0002', 0, async function (done) {
      console.info('SUB_time_systemTimer_stopTimer_0002 start.');
      try {
        console.info('SUB_time_systemTimer_stopTimer_0002 stop timer, timerID: ' + globalTimerID);
        systemTimer.stopTimer(globalTimerID)
          .then(()=>{
            console.info('SUB_time_systemTimer_stopTimer_0002 timerID:' + globalTimerID);
            done();
          }).catch(()=>{
          // 捕获业务逻辑错误
          console.info('SUB_time_systemTimer_stopTimer_0002 failed to stop timer.');
          expect().assertTrue();
          done();
        });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_stopTimer_0002 has failed for ' + err);
        expect().assertTrue();
        done();
      };
    });

    /**
     * @tc.number SUB_time_systemTimer_destroyTimer_0002
     * @tc.name SUB_time_systemTimer_destroyTimer_0002
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = true (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_destroyTimer_0002', 0, async function (done) {
      console.info('SUB_time_systemTimer_destroyTimer_0002 start.');
      try {
        console.info('SUB_time_systemTimer_destroyTimer_0002 destroy timer, timerID: ' + globalTimerID);
        systemTimer.destroyTimer(globalTimerID)
          .then(()=>{
            console.info('SUB_time_systemTimer_destroyTimer_0002 timerID:' + globalTimerID);
            done();
          }).catch(()=>{
          // 捕获业务逻辑错误
          console.info('SUB_time_systemTimer_destroyTimer_0002 failed to destroy timer.');
          expect().assertTrue();
          done();
        });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_stopTimer_0002 has failed for ' + err);
        expect().assertTrue();
        done();
      };
    });

    /**
      * @tc.number SUB_time_systemTimer_ALL_Promise_0008
      * @tc.name SUB_time_systemTimer_ALL_Promise_0008
      * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = false (Promise)
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      */
    it('SUB_time_systemTimer_ALL_Promise_0008', 0, async function (done) {
      console.info('SUB_time_systemTimer_ALL_Promise_0008 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: false
      };
      try {
        console.info('SUB_time_systemTimer_ALL_Promise_0008 create timer.');
        systemTimer.createTimer(options)
          .then((timerID)=>{
            console.info('SUB_time_systemTimer_ALL_Promise_0008 timerID:' + timerID);
            expect(Number.isInteger(timerID)).assertTrue();
            try {
              let triggerTime = new Date().getTime() + interval_time * 1.2;
              systemTimer.startTimer(timerID, triggerTime)
                .then(()=>{
                  console.info('SUB_time_systemTimer_ALL_Promise_0008 start timerID: ' + timerID);
                  try {
                    systemTimer.stopTimer(timerID)
                      .then(()=>{
                        systemTimer.destroyTimer(timerID, function (err, data) {
                          console.info('SUB_time_systemTimer_ALL_Promise_0008 destroyTimer: ' + timerID);
                          done();
                        });
                      })
                      .catch(()=>{
                        // 捕获stopTimer业务逻辑错误
                        console.info('SUB_time_systemTimer_ALL_Promise_0008 failed to stop timer.');
                        expect().assertTrue();
                        done();
                      })
                  } catch (err) {
                    // 捕获stopTimer参数错误
                    console.info('SUB_time_systemTimer_ALL_Promise_0008 stopTimer with wrong arg: ' + err);
                    expect().assertTrue();
                    done();
                  }
                })
                .catch(()=>{
                  // 捕获startTimer业务逻辑错误
                  console.info('SUB_time_systemTimer_ALL_Promise_0008 failed to stop timer.');
                  expect().assertTrue();
                  done();
                });
            } catch (err) {
              // 捕获参数错误
              console.info('SUB_time_systemTimer_ALL_Promise_0008 startTimer with wrong arg: ' + err);
              expect().assertTrue();
              done();
            }
          })
          .catch(()=>{
            // 捕获业务逻辑错误
            console.info('SUB_time_systemTimer_ALL_Promise_0008 failed to create timer.');
            expect().assertTrue();
            done();
          });
      } catch (err) {
        // 捕获参数错误
        console.info('SUB_time_systemTimer_ALL_Promise_0008 createTimer with wrong arg: ' + err);
        expect().assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_time_systemTimer_ALL_Callback_0009
     * @tc.name SUB_time_systemTimer_ALL_Callback_0009
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_WAKEUP, repeat = false (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_ALL_Callback_0009', 0, async function (done) {
      console.info('SUB_time_systemTimer_ALL_Callback_0009 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: false
      };
      try {
        console.info('SUB_time_systemTimer_ALL_Callback_0009 create timer.');
        systemTimer.createTimer(options)
          .then((timerID)=>{
            console.info('SUB_time_systemTimer_ALL_Callback_0009 timerID:' + timerID);
            expect(Number.isInteger(timerID)).assertTrue();
            try {
              let triggerTime = new Date().getTime() + interval_time * 1.2;
              systemTimer.startTimer(timerID, triggerTime, ()=>{
                console.info('SUB_time_systemTimer_ALL_Callback_0009 start timerID: ' + timerID);
                try {
                  systemTimer.stopTimer(timerID, ()=>{
                    systemTimer.destroyTimer(timerID, function (err, data) {
                      console.info('SUB_time_systemTimer_ALL_Callback_0009 destroyTimer: ' + timerID);
                      done();
                    });
                  })
                } catch (err) {
                  console.info('SUB_time_systemTimer_ALL_Callback_0009 stopTimer with wrong arg: ' + err);
                  expect().assertTrue();
                  done();
                }
              })
            } catch (err) {
              console.info('SUB_time_systemTimer_ALL_Callback_0009 startTimer with wrong arg: ' + err);
              expect().assertTrue();
              done();
            }
          })
      } catch (err) {
        console.info('SUB_time_systemTimer_ALL_Callback_0009 createTimer with wrong arg: ' + err);
        expect().assertTrue();
        done();
      }
    });
  });
}