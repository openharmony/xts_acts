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

const MAX_MISSION_NUM = 1024;

var systemAppCalleeABundleName = "com.example.systemappcalleea";
var systemAppCalleeAMainAbilityName = "com.example.systemappcalleea.MainAbility";
var thirdAppABundleName = "com.example.thirdappa";
var thirdAppAMainAbilityName = "com.example.thirdappa.MainAbility";
var thirdCallTestBundleName = "com.example.thirdcalltest";
var thirdCallTestMainAbilityName = "com.example.thirdcalltest.MainAbility";
var thirdCallTestSecondAbilityName = "com.example.thirdcalltest.SecondAbility";
var thirdCallTestThirdAbilityName = "com.example.thirdcalltest.ThirdAbility";
var thirdCallTestForthAbilityName = "com.example.thirdcalltest.ForthAbility";
var thirdCallTestFifthAbilityName = "com.example.thirdcalltest.FifthAbility";
var subscriberInfo = {
  events: ["CallTest"],
};

class MySequenceable {
  num: number = 0;
  str: string = "default";
  result: string = "default";

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

export default function abilityTest(abilityContext) {
  describe('ActsAbilityTest', function () {

    beforeEach(async (done) => {
      done();
    })

    afterEach(async (done) => {
      setTimeout(() => {
        done();
      }, 500)
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1100
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1100 begin');
      var subscriber;

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_1100 unSubscribeCallBack')
        setTimeout(()=>{done();}, 100)
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1100 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_1100 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(1100);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_1100');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_1100processed');
        console.log('AMS_CallTest_0100 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);
      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestForthAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1100, "ACTS_CommonComponent_Call_1100", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_1100 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1100 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1200
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1200 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1200 releaseCallBack' + data);
        setTimeout(()=>{done();}, 100)
      }

      let caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestFifthAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1200, "ACTS_CommonComponent_Call_1200", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_1200 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(1200);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_1200');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_1200processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1200 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1300
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1300 begin');
      var subscriber;
      var caller

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_1300 unSubscribeCallBack')
        setTimeout(()=>{done();}, 100)
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1300 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1300 releaseCallBack1' + data);
        setTimeout(() => {
          globalThis.abilityContext.startAbilityByCall({
            bundleName: thirdCallTestBundleName,
            abilityName: thirdCallTestSecondAbilityName,
          }).then(data => {
            caller = data;
            console.log('ACTS_CommonComponent_Call_1300 caller get')
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(1300, "ACTS_CommonComponent_Call_1300", 'default');
            caller.call('testCall', param).then(() => {
              console.log('ACTS_CommonComponent_Call_1300 call success');
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_1300 call exception' + err);
              expect().assertFail();
            })
          })
        },100);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_1300 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(1300);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_1300');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_1300processed');
        console.log('ACTS_CommonComponent_Call_1300 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestSecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_1300 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1400
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1400 begin');
      var caller

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1400 releaseCallBack' + data);
        setTimeout(()=>{done();}, 100)
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1400 releaseCallBack' + data);
        setTimeout(() => {
          globalThis.abilityContext.startAbilityByCall({
            bundleName: thirdCallTestBundleName,
            abilityName: thirdCallTestSecondAbilityName,
          }).then(data => {
            caller = data;
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(1400, "ACTS_CommonComponent_Call_1400", 'default');
            caller.callWithResult('testCallWithResult', param).then((data) => {
              console.log('ACTS_CommonComponent_Call_1400 call success');
              var result = new MySequenceable(0, '', '');
              data.readSequenceable(result);
              expect(result.num).assertEqual(1400);
              expect(result.str).assertEqual('ACTS_CommonComponent_Call_1400');
              expect(result.result).assertEqual('ACTS_CommonComponent_Call_1400processed');
              caller.release();
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_1400 call exception' + err);
              expect().assertFail();
              caller.release();
            })
          });
        },100);
      }

      globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestSecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_1400 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1500
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1500 begin');
      var caller;

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1500 releaseCallBack' + data);
        done();
      }

      caller = await globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1500, "ACTS_CommonComponent_Call_1500", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_1500 call success');
        var result = new MySequenceable(0, '', '');
        data.readSequenceable(result);
        expect(result.num).assertEqual(1500);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_1500');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_1500processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1500 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1600
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1600 begin');
      let caller;
      let exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall({
          bundleName: thirdAppABundleName,
          abilityName: thirdAppAMainAbilityName,
        });
        console.log('ACTS_CommonComponent_Call_1600 startAbilityByCall' + JSON.stringify(caller))
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_1600 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function request remote error");
      }

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1800
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1800 begin');
      let caller;
      let exceptionFlag = false;

      try {
        caller = await globalThis.abilityContext.startAbilityByCall({
          bundleName: thirdCallTestBundleName,
          abilityName: thirdCallTestThirdAbilityName,
        });
        console.log('ACTS_CommonComponent_Call_1800 startAbilityByCall' + JSON.stringify(caller))
      } catch(err) {
        console.log('ACTS_CommonComponent_Call_1800 exception' + err);
        exceptionFlag = true;
        expect(err.message).assertEqual("function request remote error");
      }

      expect(exceptionFlag).assertEqual(true);
      done();
    })
  })
}