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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import missionManager from '@ohos.application.missionManager'
import appManager from '@ohos.application.appManager'


var subscriberInfoMultiInstance = {
  events: ["MultiInstanceStartNext", "MultiInstanceStartFinish", "TestAppOnForeground"]
};
const START_ABILITY_TIMEOUT = 5000;
const MAX_MISSION_NUM = 1024;

function sleep(time) {
  return new Promise((resove, reject) => {
    setTimeout(() => {
      resove("time arrived");
    }, time)
  })
}

async function startAbilityProcess(abilityContext, options, parameters) {
  let bundleName;
  let abilityName;

  try {
    let idx = parameters.nextStep;
    switch (parameters.step[idx]) {
      case "testA":
        bundleName = "com.example.actsspecifytesthap";
        abilityName = "com.example.actsspecifytesthap.MainAbility";
        break;
      default:
        break;
    }
    parameters.nextStep = ++idx;
    abilityContext.startAbility({
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: parameters,
    }, options, (error, data) => {
      console.log('startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data))
    })
  } catch (err) {
    console.log('ACTS_getDisplayIdTest_0100 err: ' + err)
  }
}

function getMissionId() {
  return new Promise(async (resolve, reject) => {
    var missionId = -1;
    var missionInfos = await missionManager.getMissionInfos('', MAX_MISSION_NUM);
    for (let i = 0; i < missionInfos.length; i++) {
      console.log('getMissionId result: ' + i + '= ' + JSON.stringify(missionInfos[i]))
      if ((missionInfos[i].want.abilityName == "com.example.actsgetdisplayidtest.MainAbility") &&
        (missionInfos[i].runningState == 0)) {
        missionId = missionInfos[i].missionId;
        break;
      }
    }
    console.log('======>getMissionId resolve missionId<=======' + missionId);
    resolve(missionId);
  })
}

export default function abilityTest(abilityContext) {
  describe('ActsGetDisplayIdStartAbilityTest', function () {

    afterEach(async (done) => {
      var testMissionId;

      testMissionId = await getMissionId();
      console.log('======>afterEach test missionId<=======' + testMissionId);
      await missionManager.moveMissionToFront(testMissionId);
      await sleep(1000)
      await appManager.killProcessesByBundleName("com.example.actsspecifytesthap");
      setTimeout(() => { done(); }, 1000)
    })


    /*
    * @tc.number: ACTS_StartAbility_2100
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify Get displayId to start Ability
    */
    it('ACTS_StartAbility_2100', 0, async function (done) {
      console.log('ACTS_StartAbility_2100====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_StartAbility_2100 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_StartAbility_2100=====>');
          expect(data.parameters['displayId']).assertEqual(15);
          expect(data.parameters['windowMode']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2100 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2100 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0100 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe0100 CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_StartAbility_2100 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2100 timer id : ' + id);

      startAbilityProcess(abilityContext, {
        windowMode: 0,
        displayId: 15
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
      });
    })

    /*
    * @tc.number: ACTS_StartAbility_2300
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify that the ability to start when displayId is a string
    */
    it('ACTS_StartAbility_2300', 0, async function (done) {
      console.log('ACTS_StartAbility_2300====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_StartAbility_2300 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_StartAbility_2300=====>');
          expect(data.parameters['displayId']).assertEqual(0);
          expect(data.parameters['windowMode']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2300 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2300 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0200 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe0200 CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_StartAbility_2300 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2300 timer id : ' + id);

      startAbilityProcess(abilityContext, {
        windowMode: 0,
        displayId: "abc"
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"]
      });
    })

    /*
    * @tc.number: ACTS_StartAbility_2500
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify that the ability to start when the displayId is undefined
    */
    it('ACTS_StartAbility_2500', 0, async function (done) {
      console.log('ACTS_StartAbility_2500====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_StartAbility_2500 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_StartAbility_2500=====>');
          expect(data.parameters['displayId']).assertEqual(0);
          expect(data.parameters['windowMode']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2500 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2500 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0300 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe0300 CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_StartAbility_2500 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2500 timer id : ' + id);

      startAbilityProcess(abilityContext, {
        windowMode: 0,
        displayId: undefined
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
      });
    })

    /*
    * @tc.number: ACTS_StartAbility_2700
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Validation parameters want to filter the DISPLAY_ID of parameters
    */
    it('ACTS_StartAbility_2700', 0, async function (done) {
      console.log('ACTS_StartAbility_2700====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_StartAbility_2700 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_StartAbility_2700=====>');
          expect(data.parameters['windowMode']).assertEqual(0);
          expect(data.parameters['displayId']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2700 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2700 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0400 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe0400 CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_StartAbility_2700 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2700 timer id : ' + id);

      startAbilityProcess(abilityContext, {}, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
        "ohos.aafwk.param.displayId": 10,
      });
    })
  })
}