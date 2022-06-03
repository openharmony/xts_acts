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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import commonEvent from '@ohos.commonevent'
import missionManager from '@ohos.application.missionManager'
import appManager from '@ohos.application.appManager'

const MAX_MISSION_NUM = 1024;
var sysABundleName = "com.example.systemcalltest";
var sysAMainAbilityName = "com.example.systemcalltest.MainAbility";
var sysASecondAbilityName = "com.example.systemcalltest.SecondAbility";
var systemAppCallerABundleName = "com.example.systemappcallera";
var systemAppCallerAMainAbilityName = "com.example.systemappcallera.MainAbility";
var systemAppCallerASecondAbilityName = "com.example.systemappcallera.SecondAbility";
var systemAppCallerAThirdAbilityName = "com.example.systemappcallera.ThirdAbility";

var systemAppCalleeABundleName = "com.example.systemappcalleea";
var systemAppCalleeAMainAbilityName = "com.example.systemappcalleea.MainAbility";
var systemAppCalleeASecondAbilityName = "com.example.systemappcalleea.SecondAbility";
var systemAppCalleeAThirdAbilityName = "com.example.systemappcalleea.ThirdAbility";

var systemAppCalleeBBundleName = "com.example.systemappcalleeb";
var systemAppCalleeBMainAbilityName = "com.example.systemappcalleeb.MainAbility";
var systemAppCalleeBSecondAbilityName = "com.example.systemappcalleeb.SecondAbility";

var systemAppCalleeCBundleName = "com.example.systemappcalleec";
var systemAppCalleeCMainAbilityName = "com.example.systemappcalleec.MainAbility";
var systemAppCalleeCSecondAbilityName = "com.example.systemappcalleec.SecondAbility";

var thirdAppABundleName = "com.example.thirdappa";
var thirdAppAMainAbilityName = "com.example.thirdappa.MainAbility";
var subscriberInfo = {
  events: ["CallTest"],
};
var caseDepBundles = [];

class MySequenceable {
  num: number = 0;
  str: String = "default";
  result: String = "default";

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  setMySequence(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeString(this.result);
    return true;
  }

  unmarshalling(messageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readString();
    return true;
  }
}

function getMissionId(abilityName, state) {
  return new Promise(async (resolve, reject) => {
    let missionId = -1;
    let missionInfos = await missionManager.getMissionInfos('', MAX_MISSION_NUM);
    for (let i = 0; i < missionInfos.length; i++) {
      if ((missionInfos[i].want.abilityName == abilityName)
      && (missionInfos[i].runningState == state)) {
        missionId = missionInfos[i].missionId;
        break;
      }
    }
    console.log('======>getMissionId resolve missionId<=======' + missionId);
    resolve(missionId);
  })
}

function delay(time) {
  let delta;
  if (typeof time != 'number' || time <= 0) {
    delta = 100;
  } else {
    delta = Math.round(time);
  }
  for (let start = Date.now(); Date.now() - start <= delta; );
}

function clearDepProcess(bundleNames, callback, undoneCallBack) {
  var result;
  var cnt = 0;

  if (bundleNames.length == 0) {
    undoneCallBack();
  }
  for (let i = 0; i < bundleNames.length; i++) {
    result = appManager.killProcessesByBundleName(bundleNames[i], (err, data) => {
      console.log("clearDepProcess killProcessesByBundleName bundleName: " + bundleNames[i]);
      console.log("clearDepProcess killProcessesByBundleName err: " + JSON.stringify(err));
      console.log("clearDepProcess killProcessesByBundleName data: " + JSON.stringify(data));
      cnt++;
      if (cnt == bundleNames.length) {
        callback();
      }
    });
  }
}

export default function abilityTest(abilityContext) {
  describe('ActsAbilityTest', function () {

    beforeEach(async (done) => {
      done();
    })

    afterEach(async (done) => {
      var testMissionId;

      testMissionId = await getMissionId(sysAMainAbilityName, 0);
      console.log('======>afterEach test missionId<=======' + testMissionId);
      if (testMissionId != -1) {
        await missionManager.moveMissionToFront(testMissionId);
      }
      console.log('======>afterEach test missionId move to front<=======');

      clearDepProcess(caseDepBundles, () => {
        caseDepBundles = [];
        setTimeout(() => {
          done();
        }, 500)
      }, () => {
        done();
      });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0100
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0100 begin');
      var subscriber;

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0100 unSubscribeCallBack')
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0100 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0100 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(100);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0100');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0100processed');
        console.log('AMS_CallTest_0100 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);
      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(100, "ACTS_CommonComponent_Call_0100", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0100 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0100 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0200
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0200 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0200 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(200, "ACTS_CommonComponent_Call_0200", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_0200 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(200);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_0200');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_0200processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0200 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0300
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0300 begin');
      var subscriber;
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0300 unSubscribeCallBack')
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0300 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0300 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(300);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0300');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0300processed');
        console.log('ACTS_CommonComponent_Call_0300 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(300, "ACTS_CommonComponent_Call_0300", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0300 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0300 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0400
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0400', 0, async function (done) {
      caseDepBundles = [systemAppCalleeABundleName];
      console.log('ACTS_CommonComponent_Call_0400 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0400 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(400, "ACTS_CommonComponent_Call_0400", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_0400 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(400);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_0400');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_0400processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0400 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0500
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0500 begin');
      var subscriber;
      var caller1;
      var caller2;
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0500 unSubscribeCallBack')
        caller1.release();
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0500 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0500 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(500);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0500');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0500processed');
        console.log('ACTS_CommonComponent_Call_0500 do release');
        caller2.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      caller1 = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller2 = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      });

      caller2.onRelease(releaseCallback);
      let param = new MySequenceable(500, "ACTS_CommonComponent_Call_0500", 'default');
      caller2.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0500 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0500 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0600
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0600', 0, async function (done) {
      caseDepBundles = [systemAppCalleeABundleName];
      console.log('ACTS_CommonComponent_Call_0600 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0600 releaseCallBack' + data);
        caller1.release();
        done();
      }

      let caller1 = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });
      let caller2 = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      });

      caller2.onRelease(releaseCallback);
      let param = new MySequenceable(600, "ACTS_CommonComponent_Call_0600", 'default');
      caller2.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_0600 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(600);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_0600');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_0600processed');
        caller2.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0600 call exception' + err);
        expect().assertFail();
        caller2.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0700
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0700 begin');
      var subscriber;
      var caller;
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0700 unSubscribeCallBack')
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0700 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0700 releaseCallBack1' + data);
        setTimeout(() => {
          globalThis.abilityContext.startAbilityByCall({
            bundleName: systemAppCalleeABundleName,
            abilityName: systemAppCalleeASecondAbilityName,
          }).then(data => {
            caller = data;
            console.log('ACTS_CommonComponent_Call_0700 caller get')
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(700, "ACTS_CommonComponent_Call_0700", 'default');
            caller.call('testCall', param).then(() => {
              console.log('ACTS_CommonComponent_Call_0700 call success');
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_0700 call exception' + err);
              expect().assertFail();
            })
          })
        }, 100);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0700 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(700);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0700');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0700processed');
        console.log('ACTS_CommonComponent_Call_0700 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_0700 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0800
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0800 begin');
      var caller;
      caseDepBundles = [systemAppCalleeABundleName];

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0800 releaseCallBack' + data);
        done();
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0800 releaseCallBack' + data);
        setTimeout(() => {
          globalThis.abilityContext.startAbilityByCall({
            bundleName: systemAppCalleeABundleName,
            abilityName: systemAppCalleeASecondAbilityName,
          }).then(data => {
            caller = data;
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(800, "ACTS_CommonComponent_Call_0800", 'default');
            caller.callWithResult('testCallWithResult', param).then((data) => {
              console.log('ACTS_CommonComponent_Call_0800 call success');
              var result = new MySequenceable(0, '', '');
              data.readSequenceable(result);
              expect(result.num).assertEqual(800);
              expect(result.str).assertEqual('ACTS_CommonComponent_Call_0800');
              expect(result.result).assertEqual('ACTS_CommonComponent_Call_0800processed');
              caller.release();
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_0800 call exception' + err);
              expect().assertFail();
              caller.release();
            })
          });
        }, 100);
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_0800 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0900
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0900 begin');
      var subscriber;
      caseDepBundles = [thirdAppABundleName];
      var caller;

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0900 unSubscribeCallBack')
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0900 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0900 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(900);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0900');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0900processed');
        console.log('AMS_CallTest_0100 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);
      caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(900, "ACTS_CommonComponent_Call_0900", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0900 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0900 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1000
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1000', 0, async function (done) {
      caseDepBundles = [thirdAppABundleName];
      console.log('ACTS_CommonComponent_Call_1000 begin');
      var caller;

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1000 releaseCallBack' + data);
        done();
      }

      caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1000, "ACTS_CommonComponent_Call_1000", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_1000 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(1000);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_1000');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_1000processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1000 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1700
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1700 begin');
      var caller;
      var exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall({
          bundleName: systemAppCalleeABundleName,
          abilityName: systemAppCalleeAThirdAbilityName,
        });
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_1700 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function request remote error");
      }
      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1900
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1900 begin');
      var subscriber;
      var callBackCnt = 0;

      function checkFinish() {
        if (callBackCnt >= 3) {
          console.log('ACTS_CommonComponent_Call_1900 finish release')
          caller.release();
        }
      }

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_1900 unSubscribeCallBack')
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1900 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_1900 subscribeCallBack data:' + JSON.stringify(data))
        if (data.data == 'calleeCheckCallParam') {
          expect(data.parameters.num).assertEqual(1900);
          expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_1900');
          expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_1900processed');
          callBackCnt++;
          checkFinish();
        } else if (data.data == 'calleeCheckCall2Param') {
          expect(data.parameters.num).assertEqual(1900);
          expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_1900');
          expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_1900processed2');
          callBackCnt++;
          checkFinish();
        }
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);
      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1900, "ACTS_CommonComponent_Call_1900", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_1900 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1900 call exception' + err);
        expect().assertFail();
      })
      caller.call('testCall2', param).then(() => {
        console.log('ACTS_CommonComponent_Call_1900 call2 success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1900 call2 exception' + err);
        expect().assertFail();
      })

      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_1900 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(1900);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_1900');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_1900processed');
        callBackCnt++;
        checkFinish();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1900 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2000
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can register the server's death listener.
     */
    it('ACTS_CommonComponent_Call_2000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2000 begin');

      function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_2000 releaseCallBack:' + data);
        expect(data).assertEqual("died");
        done();
      }

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_2000 startAbilityByCall fail');
        expect().assertFail();
      }
      try {
        caller.onRelease(releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_2000 Caller onRelease fail ' + e);
        expect().assertFail();
      }
      await appManager.killProcessesByBundleName(bundleNameCallee);
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2300
     * @tc.name: Callee is in standalone process AbilityStage of the same app.
     * @tc.desc: Verify Callee is in standalone process AbilityStage of the same app.
     */
    it('ACTS_CommonComponent_Call_2300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2300 begin');

      let bundleNameCallee = "com.example.systemcalltest";
      let abilityNameCallee = "com.example.second.MainAbility";

      function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_2300 releaseCallBack:' + data);
        expect(data).assertEqual("release");
        done();
      }

      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_2300 startAbilityByCall fail');
        expect().assertFail();
        done();
      }

      try {
        caller.onRelease(releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_2300 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }
      let param = new MySequenceable(2300, "case2300", 'default');
      caller.callWithResult('test2300', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_2300 callWithResult ' + JSON.stringify(data));
        let result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.str).assertEqual("onCreateonBackground");
        expect(result.num).assertEqual(0);
      });

      try {
        caller.release();
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_2300 Caller Release fail:' + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2400
     * @tc.name: The service party cannot provide the corresponding service after calling Callee.off.
     * @tc.desc: The verification service party cannot provide the corresponding service after calling Callee.off.
     */
    it('ACTS_CommonComponent_Call_2400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2400 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2400 releaseCallBack ' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2400, "case2400", 'default');
      let beforeOff = 0;
      let afterOff = 0;
      await caller.call('testOff', param).then(() => {
        console.log('ACTS_CommonComponent_Call_2400 call success');
        beforeOff = 1;
      }).catch(err => {
        beforeOff = 2;
      })

      globalThis.secondCallee.off('testOff');

      await caller.call('testOff', param).then(() => {
        console.log('ACTS_CommonComponent_Call_2400 call success');
        afterOff = 1;
      }).catch(err => {
        afterOff = 2;
      })

      expect(beforeOff).assertEqual(1);
      expect(afterOff).assertEqual(2);
      caller.release();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2500
     * @tc.name: The parameter "method" of the Caller.call function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.call function is an empty string.
     */
    it('ACTS_CommonComponent_Call_2500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2500 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2500 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2500, "case2500", 'default');
      caller.call('', param).then(() => {
        console.log('ACTS_CommonComponent_Call_2500 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_2500 call exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2600
     * @tc.name: The parameter "method" of the Caller.call function is null.
     * @tc.desc: Verify that the parameter "method" of the Caller.call function is null.
     */
    it('ACTS_CommonComponent_Call_2600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2600 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2600 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2600, "case2600", 'default');
      caller.call(null, param).then(() => {
        console.log('ACTS_CommonComponent_Call_2600 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_2600 call exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2700
     * @tc.name: The parameter "method" of the Caller.call function is undefined.
     * @tc.desc: Verify that the parameter "method" of the Caller.call function is undefined.
     */
    it('ACTS_CommonComponent_Call_2700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2700 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2700 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2700, "case2700", 'default');
      caller.call(undefined, param).then(() => {
        console.log('ACTS_CommonComponent_Call_2700 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_2700 call exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2800
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_2800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2800 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2800 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2800, "case2800", 'default');
      caller.callWithResult('', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_2800 callWithResult success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_2800 callWithResult exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_2900
     * @tc.name: The parameter "method" of the Caller.callWithResult function is null.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is null.
     */
    it('ACTS_CommonComponent_Call_2900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_2900 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_2900 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(2900, "case2900", 'default');
      caller.callWithResult(null, param).then((data) => {
        console.log('ACTS_CommonComponent_Call_2900 callWithResult success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_2900 callWithResult exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3000
     * @tc.name: The parameter "method" of the Caller.callWithResult function is undefined.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is undefined.
     */
    it('ACTS_CommonComponent_Call_3000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3000 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_3000 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(3000, "case3000", 'default');
      caller.callWithResult(undefined, param).then((data) => {
        console.log('ACTS_CommonComponent_Call_3000 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_3000 catch exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3100
     * @tc.name: The parameter method of the Callee.on function is an empty string.
     * @tc.desc: Verify that the parameter method of the Callee.on function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3100 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3100 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on('', onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3100 callee.on err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3200
     * @tc.name: The parameter method of the Callee.on function is null.
     * @tc.desc: Verify that the parameter method of the Callee.on function is null.
     */
    it('ACTS_CommonComponent_Call_3200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3200 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3200 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(null, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3200 callee.on err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3300
     * @tc.name: The parameter method of the Caller.callWithResult function is undefined.
     * @tc.desc: Verify that the parameter method of the Caller.callWithResult function is undefined.
     */
    it('ACTS_CommonComponent_Call_3300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3300 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3300 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(undefined, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3300 callee.on err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3400
     * @tc.name: The parameter "method" of the Callee.off function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3400 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off('');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3400 callee.off err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3500
     * @tc.name: The parameter "method" of the Callee.off function is null.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is null.
     */
    it('ACTS_CommonComponent_Call_3500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3500 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3500 callee.off err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3600
     * @tc.name: The parameter “method” of the Callee.off function is undefined.
     * @tc.desc: Verify that the parameter “method” of the Callee.off function is undefined.
     */
    it('ACTS_CommonComponent_Call_3600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3600 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3600 callee.off err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_3700
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_3700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3700 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_3700 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      console.log('ACTS_CommonComponent_Call_3700 before onRelease')
      caller.onRelease(releaseCallback);
      console.log('ACTS_CommonComponent_Call_3700 before call')
      caller.call('testCall', "").then(() => {
        console.log('ACTS_CommonComponent_Call_3700 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_3700 catch exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_3800
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_3800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3800 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_3800 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      console.log('ACTS_CommonComponent_Call_3800 before onRelease')
      caller.onRelease(releaseCallback);
      console.log('ACTS_CommonComponent_Call_3800 before call')
      caller.call('testCall', null).then(() => {
        console.log('ACTS_CommonComponent_Call_3800 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_3800 catch exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_3900
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_3900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3900 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_3900 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      });

      console.log('ACTS_CommonComponent_Call_3900 before onRelease')
      caller.onRelease(releaseCallback);
      console.log('ACTS_CommonComponent_Call_3900 before call')
      caller.call('testCall', undefined).then(() => {
        console.log('ACTS_CommonComponent_Call_3900 call success');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_3900 catch exception' + err);
        expect(err.message).assertEqual("function input parameter error");
        caller.release();
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4000
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4000 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_4000 release CallBack' + data);
        done();
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      }).then((data) => {
        let caller = data;
        console.log('ACTS_CommonComponent_Call_4000 before onRelease')
        caller.onRelease(releaseCallback);
        console.log('ACTS_CommonComponent_Call_4000 before call')
        caller.callWithResult('testCallWithResult', "").then((data) => {
          console.log('ACTS_CommonComponent_Call_4000 call success');
          expect(data).assertEqual(undefined);
          caller.release();
        }).catch((e) => {
          console.log('ACTS_CommonComponent_Call_4000 call err' + e);
          caller.release();
        });
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4100
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4100 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_4100 release CallBack' + data);
        done();
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      }).then((data) => {
        let caller = data;
        console.log('ACTS_CommonComponent_Call_4100 before onRelease')
        caller.onRelease(releaseCallback);
        console.log('ACTS_CommonComponent_Call_4100 before call')
        caller.callWithResult('testCallWithResult', null).then((data) => {
          console.log('ACTS_CommonComponent_Call_4100 call success');
          expect(data).assertEqual(undefined);
          caller.release();
        }).catch((e) => {
          console.log('ACTS_CommonComponent_Call_4100 call err' + e);
          caller.release();
        });
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4200
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4200 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_4200 release CallBack' + data);
        done();
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      }).then((data) => {
        let caller = data;
        console.log('ACTS_CommonComponent_Call_4200 before onRelease')
        caller.onRelease(releaseCallback);
        console.log('ACTS_CommonComponent_Call_4200 before call')
        caller.callWithResult('testCallWithResult', undefined).then((data) => {
          console.log('ACTS_CommonComponent_Call_4200 call success');
          expect(data).assertEqual(undefined);
          caller.release();
        }).catch((e) => {
          console.log('ACTS_CommonComponent_Call_4200 call err' + e);
          caller.release();
        });
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4300
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4300 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', "");
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4300 call err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4400
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4400 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4400 call err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4500
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4500 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4500 call err' + err);
        expect(err.message).assertEqual("function input parameter error");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_4800
     * @tc.name: Callee is in standalone process AbilityStage of the same app.
     * @tc.desc: Verify Callee is in standalone process AbilityStage of the same app.
     */
    it('ACTS_CommonComponent_Call_4800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4800 begin');

      let bundleNameCallee = "com.example.systemcalltest";
      let abilityNameCallee = "com.example.second.MainAbility";

      function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_4800 releaseCallBack:' + data);
        expect(data).assertEqual("release");
        done();
      }

      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_4800 startAbilityByCall fail');
        expect().assertFail();
        done();
      }

      try {
        caller.onRelease(releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_4800 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }
      let param = new MySequenceable(4600, "case4600", 'default');
      caller.callWithResult('test4600', param).then((data) => {
        let result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.str).assertEqual("onCreateonBackground");
        expect(result.num).assertEqual(0);
      });

      try {
        caller.release();
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_4800 Caller Release fail:' + e);
        expect().assertFail();
        done();
      }
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4900
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4900 begin');
      let caller;
      let sequenceable = new MySequenceable(1, 'ACTS_CommonComponent_Call_4900', 'default');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_4900 releaseCallBack ' + data);
        caller.call('testCall', sequenceable).then(() => {
          console.log('ACTS_CommonComponent_Call_4900 call2 success');
          expect().assertFail();
          done();
        }).catch(err => {
          console.log('ACTS_CommonComponent_Call_4900 call2 err ' + err);
          expect(err.message).assertEqual("function inner object error");
          done();
        })
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      }).then((data) => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_4900 before onRelease')
        caller.onRelease(releaseCallback);
        console.log('ACTS_CommonComponent_Call_4900 before call')
        delay(100);
        caller.call('testCall', sequenceable).then(() => {
          console.log('ACTS_CommonComponent_Call_4900 call1 success');
          caller.release();
        }).catch((e) => {
          console.log('ACTS_CommonComponent_Call_4900 call err' + e);
          expect().assertFail();
          done();
        });
      })
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5000
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5000 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5000 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5000');
        done();
      }
      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err' + err);
        expect(err.message).assertEqual("function is registered");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      globalThis.callee.off('ACTS_CommonComponent_Call_5000');
      console.log('ACTS_CommonComponent_Call_5000 finished');
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5100
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5100 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5100 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5100', testCallback_5100);
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 first step err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
        done();
      }
      try {
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 call err' + err);
        expect(err.message).assertEqual("function not registered");
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      console.log('ACTS_CommonComponent_Call_5100 finished');
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5200
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5200 begin');
      let caller;
      let exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall(null);
        console.log('ACTS_CommonComponent_Call_5200 startAbilityByCall' + JSON.stringify(caller))
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_5200 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function input parameter error");
      }

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5300
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5300 begin');
      let caller;
      let exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall({
          bundleName: "",
          abilityName: "",
        });
        console.log('ACTS_CommonComponent_Call_5300 startAbilityByCall' + JSON.stringify(caller))
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_5300 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function request remote error");
      }

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5400
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5400 begin');
      let caller;
      let exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall(undefined);
        console.log('ACTS_CommonComponent_Call_5400 startAbilityByCall' + JSON.stringify(caller))
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_5400 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function input parameter error");
      }

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5700
     * @tc.name: The mission of callee is not in recent list when startAbilityByCall only.
     * @tc.desc: Verify the mission of callee is not in recent list when startAbilityByCall only.
     */
    it('ACTS_CommonComponent_Call_5700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5700 begin');

      let bundleNameCallee = "com.example.systemcalltest";
      let abilityNameCallee = "com.example.systemcalltest.SecondAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5700 startAbilityByCall fail');
        expect().assertFail();
        done();
      }

      async function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_5700 releaseCallBack:' + data);
        expect(data).assertEqual("release");

        let missionId = await getMissionId(abilityNameCallee, 0);
        expect(missionId == -1).assertTrue();
        done();
      }

      try {
        caller.onRelease(releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5700 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }

      try {
        caller.release();
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5700 Caller Release fail:' + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5800
     * @tc.name: The mission of callee is in recent list when startAbilityByCall then startAbility.
     * @tc.desc: Verify the mission of callee is in recent list when startAbilityByCall then startAbility.
     */
    it('ACTS_CommonComponent_Call_5800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5800 begin');

      let bundleNameCallee = "com.example.systemcalltest";
      let abilityNameCallee = "com.example.systemcalltest.SecondAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5800 startAbilityByCall fail');
        expect().assertFail();
        done();
      }

      function startAbilityCallback(err) {
        console.log('ACTS_CommonComponent_Call_5800 startAbilityCallback');
        if (err.code != 0) {
          expect().assertFail();
          done();
        }
      }

      await globalThis.abilityContext.startAbility(want, startAbilityCallback);

      async function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_5800 releaseCallBack:' + data);
        expect(data).assertEqual("release");

        let missionId = await getMissionId(abilityNameCallee, 0);
        expect(missionId != -1).assertTrue();
        done();
      }
      try {
        caller.onRelease(releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5800 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }

      try {
        caller.release();
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5800 Caller Release fail:' + e);
        expect().assertFail();
        done();
      }
    })
  })
}