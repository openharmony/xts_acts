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
    console.info('====>systemTimer Test start');
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
      operationType: WantAgent.OperationType.START_SERVICE,
      requestCode: 0,
      wantAgentFlags: [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
    }

    let interval_time = 5000;

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('====>beforeAll: Prerequisites are executed.');
      WantAgent.getWantAgent(wantAgentInfo)
        .then((data) => {
          if (data != undefined || data != null) {
            console.info('====>beforeAll: success to get wantAgent: ' + typeof (data));
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
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed.');
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
      console.info('====>SUB_time_systemTimer_createTimer_0000 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      console.info('====>SUB_time_systemTimer_createTimer_0000 create timer.');
      systemTimer.createTimer(options, function (err, timerID) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_createTimer_0000 create fail: ' + err);
            expect().assertTrue();
            done();
          }
          console.info('====>SUB_time_systemTimer_createTimer_0000 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        } catch (error) {
          console.info('====>SUB_time_systemTimer_createTimer_0000 catch err ' + error);
          done();
        };
      });
      console.info('====>SUB_time_systemTimer_createTimer_0000 end.');
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
      console.info('====>SUB_time_systemTimer_createTimer_0001 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_IDLE,
        repeat: false
      };
      console.info('====>SUB_time_systemTimer_createTimer_0001 create timer.');
      systemTimer.createTimer(options, function (err, timerID) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_createTimer_0001 create fail: ' + err);
            expect().assertTrue();
            done();
          }
          console.info('====>SUB_time_systemTimer_createTimer_0001 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        } catch (error) {
          console.info('====>SUB_time_systemTimer_createTimer_0001 catch err ' + error);
          done();
        };
      });
      console.info('====>SUB_time_systemTimer_createTimer_0001 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0002 start");
      WantAgent.getBundleName(wantAgent, (err, data) => {
        console.info('====>SUB_time_systemTimer_createTimer_0002 BundleName: ' + data);
      })
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      console.info('====>SUB_time_systemTimer_createTimer_0002 create timer.');
      systemTimer.createTimer(options, function (err, timerID) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_createTimer_0002 create fail: ' + err);
            expect().assertTrue();
            done();
          }
          console.info('====>SUB_time_systemTimer_createTimer_0002 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        } catch (error) {
          console.info('====>SUB_time_systemTimer_createTimer_0002 catch err ' + error);
          done();
        };
      });
      console.info('====>SUB_time_systemTimer_createTimer_0002 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0003 start");
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      console.info('====>SUB_time_systemTimer_createTimer_0003 create timer.');
      systemTimer.createTimer(options, function (err, timerID) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_createTimer_0003 create fail: ' + err);
            expect().assertTrue();
            done();
          }
          console.info('====>SUB_time_systemTimer_createTimer_0003 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        } catch (error) {
          console.info('====>SUB_time_systemTimer_createTimer_0003 catch err ' + error);
          done();
        };
      });
      console.info('====>SUB_time_systemTimer_createTimer_0003 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0004 start");
      WantAgent.getBundleName(wantAgent, (err, data) => {
        console.info("====>SUB_time_systemTimer_createTimer_0004 BundleName: " + data);
      });
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      console.info('====>SUB_time_systemTimer_createTimer_0004 create timer.');
      systemTimer.createTimer(options, function (err, timerID) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_createTimer_0004 create fail: ' + err);
            expect().assertTrue();
            done();
          }
          console.info('====>SUB_time_systemTimer_createTimer_0004 timerID: ' + timerID);
          expect(Number.isInteger(timerID)).assertTrue();
          done();
        } catch (error) {
          console.info('====>SUB_time_systemTimer_createTimer_0004 catch err ' + error);
          done();
        };
      });
      console.info('====>SUB_time_systemTimer_createTimer_0004 end.');
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
      console.info('====>SUB_time_systemTimer_createTimer_0005 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0005 timerID: ' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0005 createTimer fail: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_createTimer_0005 end.');
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
      console.info('====>SUB_time_systemTimer_createTimer_0006 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_IDLE,
        repeat: false
      };
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0006 timerID: ' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0006 createTimer fail: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_createTimer_0006 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0007 start");
      WantAgent.getBundleName(wantAgent, (err, data) => {
        console.info('====>SUB_time_systemTimer_createTimer_0007 BundleName: ' + data);
      })
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0007 timerID: ' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0007 createTimer fail: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_createTimer_0007 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0008 start");
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0008 timerID: ' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0008 createTimer fail: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_createTimer_0008 end.');
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
      console.info("====>SUB_time_systemTimer_createTimer_0009 start");
      WantAgent.getBundleName(wantAgent, (err, data) => {
        console.info("====>SUB_time_systemTimer_createTimer_0009 BundleName: " + data);
      });
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: true,
        wantAgent: wantAgent,
        interval: interval_time
      };
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_createTimer_0009 end.');
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
      console.info("====>SUB_time_systemTimer_startTimer_0001 start");
      let triggerTime = new Date().getTime() + interval_time * 1.2;
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      systemTimer.startTimer(globalTimerID, triggerTime, function (err, data) {
        try {
          if (err) {
            console.info('====>SUB_time_systemTimer_startTimer_0001 wrong since ' + err.code);
            expect().assertTrue();
            done();
          }
          console.info("====>SUB_time_systemTimer_startTimer_0001 success to start timerID: " + globalTimerID);
          expect(true).assertTrue();
          done();
        } catch (e) {
          console.info('====>SUB_time_systemTimer_startTimer_0001 has failed for ' + e);
          done();
        };
      });
      console.info("====>SUB_time_systemTimer_startTimer_0001 end");
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
      console.info("====>SUB_time_systemTimer_stopTimer_0001 start");
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      systemTimer.stopTimer(globalTimerID, function (err, data) {
        try {
          if (err) {
            console.info("====>SUB_time_systemTimer_stopTimer_0001 stop fail timerID: " + globalTimerID);
            expect().assertTrue();
            done();
          };
          console.info("====>SUB_time_systemTimer_stopTimer_0001 success to stop timerID: " + globalTimerID);
          expect(true).assertTrue();
          done();
        } catch (e) {
          console.info('====>SUB_time_systemTimer_stopTimer_0001 has failed for ' + e);
          done();
        };
      });
      console.info("====>SUB_time_systemTimer_stopTimer_0001 end");
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
      console.info("====>SUB_time_systemTimer_destroyTimer_0001 start");
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: true
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      systemTimer.destroyTimer(globalTimerID, function (err, data) {
        try {
          if (err) {
            console.info("====>SUB_time_systemTimer_destroyTimer_0001 destroy timer, timerID: " + globalTimerID)
            expect().assertTrue();
            done();
          };
          console.info("====>SUB_time_systemTimer_destroyTimer_0001 success to destroy timerID: " + globalTimerID);
          expect(true).assertTrue();
          done();
        } catch (e) {
          console.info('====>SUB_time_systemTimer_destroyTimer_0001 has failed for ' + e);
          done();
        };
      });
      console.info("====>SUB_time_systemTimer_destroyTimer_0001 end");
    });

    /**
     * @tc.number SUB_time_systemTimer_createTimerPromise_0001
     * @tc.name SUB_time_systemTimer_createTimerPromise_0001
     * @tc.desc Test createTimer() interfaces, type = TIMER_TYPE_REALTIME, repeat = false (Promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_time_systemTimer_createTimerPromise_0001', 0, async function (done) {
      console.info('====>SUB_time_systemTimer_createTimerPromise_0001 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      console.info('====>SUB_time_systemTimer_createTimerPromise_0001 create timer.');
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimerPromise_0001 timerID:' + timerID);
        expect(Number.isInteger(timerID)).assertTrue();
        done();
      }).catch(error => {
        console.info('====>SUB_time_systemTimer_createTimerPromise_0001 failed to create timer: ' + error);
        expect().assertTrue();
        done();
      });
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
      console.info('====>SUB_time_systemTimer_startTimer_0002 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_IDLE,
        repeat: true
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      let triggerTime = new Date().getTime() + interval_time * 2;
      await systemTimer.startTimer(globalTimerID, triggerTime).then(() => {
        console.info('====>SUB_time_systemTimer_startTimer_0002 timerID:' + globalTimerID);
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.info('====>SUB_time_systemTimer_startTimer_0002 failed to start timer: ' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_startTimer_0002 end.');
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
      console.info('====>SUB_time_systemTimer_stopTimer_0002 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_EXACT,
        repeat: false
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      await systemTimer.stopTimer(globalTimerID).then(() => {
        console.info('====>SUB_time_systemTimer_stopTimer_0002 timerID:' + globalTimerID);
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.info('====>SUB_time_systemTimer_stopTimer_0002 failed to stop timer:' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_stopTimer_0002 end.');
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
      console.info('====>SUB_time_systemTimer_destroyTimer_0002 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_REALTIME,
        repeat: false
      };
      let globalTimerID;
      await systemTimer.createTimer(options).then((timerID) => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 timerID: ' + timerID);
        globalTimerID = timerID;
      }).catch(err => {
        console.info('====>SUB_time_systemTimer_createTimer_0009 createTimer fail: ' + err);
      });
      await systemTimer.destroyTimer(globalTimerID).then(() => {
        console.info('====>SUB_time_systemTimer_destroyTimer_0002 timerID:' + globalTimerID);
        expect(true).assertTrue();
        done();
      }).catch((err ) => {
        console.info('====>SUB_time_systemTimer_destroyTimer_0002 failed to destroy timer:' + err);
        expect().assertTrue();
        done();
      });
      console.info('====>SUB_time_systemTimer_destroyTimer_0002 end.');
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
      console.info('====>SUB_time_systemTimer_ALL_Promise_0008 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: false
      };
      try {
        console.info('====>SUB_time_systemTimer_ALL_Promise_0008 create timer.');
        systemTimer.createTimer(options)
          .then((timerID) => {
            console.info('====>SUB_time_systemTimer_ALL_Promise_0008 timerID:' + timerID);
            try {
              expect(Number.isInteger(timerID)).assertTrue();
              let triggerTime = new Date().getTime() + interval_time * 1.2;
              systemTimer.startTimer(timerID, triggerTime)
                .then(() => {
                  console.info('====>SUB_time_systemTimer_ALL_Promise_0008 start timerID: ' + timerID);
                  try {
                    systemTimer.stopTimer(timerID)
                      .then(() => {
                        systemTimer.destroyTimer(timerID, function (err, data) {
                          console.info('====>SUB_time_systemTimer_ALL_Promise_0008 destroyTimer: ' + timerID);
                          done();
                        });
                      })
                      .catch(() => {
                        // 捕获stopTimer业务逻辑错误
                        console.info('====>SUB_time_systemTimer_ALL_Promise_0008 failed to stop timer.');
                        expect().assertTrue();
                        done();
                      })
                  } catch (err) {
                    // 捕获stopTimer参数错误
                    console.info('====>SUB_time_systemTimer_ALL_Promise_0008 stopTimer with wrong arg: ' + err);
                    expect().assertTrue();
                    done();
                  }
                })
                .catch(() => {
                  // 捕获startTimer业务逻辑错误
                  console.info('====>SUB_time_systemTimer_ALL_Promise_0008 failed to stop timer.');
                  expect().assertTrue();
                  done();
                });
            } catch (err) {
              // 捕获参数错误
              console.info('====>SUB_time_systemTimer_ALL_Promise_0008 startTimer with wrong arg: ' + err);
              expect().assertTrue();
              done();
            }
          })
          .catch(() => {
            // 捕获业务逻辑错误
            console.info('====>SUB_time_systemTimer_ALL_Promise_0008 failed to create timer.');
            expect().assertTrue();
            done();
          });
      } catch (err) {
        // 捕获参数错误
        console.info('====>SUB_time_systemTimer_ALL_Promise_0008 createTimer with wrong arg: ' + err);
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
      console.info('====>SUB_time_systemTimer_ALL_Callback_0009 start.');
      let options = {
        type: systemTimer.TIMER_TYPE_WAKEUP,
        repeat: false
      };
      try {
        console.info('====>SUB_time_systemTimer_ALL_Callback_0009 create timer.');
        systemTimer.createTimer(options)
          .then((timerID) => {
            console.info('====>SUB_time_systemTimer_ALL_Callback_0009 timerID:' + timerID);
            try {
              expect(Number.isInteger(timerID)).assertTrue();
              let triggerTime = new Date().getTime() + interval_time * 1.2;
              systemTimer.startTimer(timerID, triggerTime, () => {
                console.info('====>SUB_time_systemTimer_ALL_Callback_0009 start timerID: ' + timerID);
                try {
                  systemTimer.stopTimer(timerID, () => {
                    systemTimer.destroyTimer(timerID, function (err, data) {
                      console.info('====>SUB_time_systemTimer_ALL_Callback_0009 destroyTimer: ' + timerID);
                      done();
                    });
                  })
                } catch (err) {
                  console.info('====>SUB_time_systemTimer_ALL_Callback_0009 stopTimer with wrong arg: ' + err);
                  expect().assertTrue();
                  done();
                }
              })
            } catch (err) {
              console.info('====>SUB_time_systemTimer_ALL_Callback_0009 startTimer with wrong arg: ' + err);
              expect().assertTrue();
              done();
            }
          })
      } catch (err) {
        console.info('====>SUB_time_systemTimer_ALL_Callback_0009 createTimer with wrong arg: ' + err);
        expect().assertTrue();
        done();
      };
    });
  });
}