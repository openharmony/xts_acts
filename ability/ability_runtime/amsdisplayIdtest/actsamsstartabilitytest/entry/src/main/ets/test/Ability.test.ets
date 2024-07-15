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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager';
import {Driver, ON} from '@ohos.UiTest';
import display from '@ohos.display';
import { startAbilityProcess } from './Utils';

let displayClassId = display.getDefaultDisplaySync().id;
let driver = Driver.create();

let subscriberInfoMultiInstance:commonEvent.CommonEventSubscribeInfo = {
  events: ["MultiInstanceStartNext", "MultiInstanceStartFinish", "TestAppOnForeground"]
};
const START_ABILITY_TIMEOUT = 5000;

interface Parameters{
  startId: number,
  stepNum: number,
  nextStep: number,
  step: Array<string>,
  "ohos.aafwk.param.displayId": number,
}

export default function abilityTest() {
  describe('ActsGetDisplayIdStartAbilityTest',  ()=> {

    beforeEach(async (done:Function) => {
      setTimeout(() => { done(); }, 3000)
    })

    /*
    * @tc.number: ACTS_StartAbility_2100
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify Get displayId to start Ability
    */
    it('ACTS_StartAbility_2100', 0, async (done:Function) => {
      console.log('ACTS_StartAbility_2100====<begin');
      let id:number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0100 Subscriber====>");
        let subscriber = data;
        commonEvent.subscribe(subscriber, (err, data)=>{
          console.debug("====>ACTS_StartAbility_2100 Subscribe CallBack data:====>" + JSON.stringify(data));

          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2100 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2100=====>');
            expect(data.parameters['displayId']).assertEqual(displayClassId);
            commonEvent.unsubscribe(subscriber, ()=>{
              console.debug("====>UnSubscribe0100 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2100 callBackSeq = ' + data.data);
          }
        });
      })
      id = setTimeout(()=>{
        expect().assertFail();
        console.log('ACTS_StartAbility_2100 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2100 timer id : ' + id);

      await startAbilityProcess(driver, {
        displayId: displayClassId
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
    it('ACTS_StartAbility_2300', 0, async (done:Function) => {
      console.log('ACTS_StartAbility_2300====<begin');
      let id:number = -1;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0200 Subscriber====>");
        let subscriber = data;
        commonEvent.subscribe(subscriber, (err, data)=>{
          console.debug("====>ACTS_StartAbility_2300 Subscribe CallBack data:====>" + JSON.stringify(data));

          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2300 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2300=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, ()=>{
              console.debug("====>UnSubscribe0200 CallBack====>");
            })
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2300 callBackSeq = ' + data.data);
          }
        });
      })

      id = setTimeout(()=>{
        expect().assertFail();
        console.log('ACTS_StartAbility_2300 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2300 timer id : ' + id);

      await startAbilityProcess(driver, {
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
    it('ACTS_StartAbility_2500', 0, async (done:Function) => {
      console.log('ACTS_StartAbility_2500====<begin');
      let id:number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0300 Subscriber====>");
        let subscriber = data;
        commonEvent.subscribe(subscriber, (err, data)=>{
          console.debug("====>ACTS_StartAbility_2500 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2500 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2500=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, ()=>{
              console.debug("====>UnSubscribe0300 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2500 callBackSeq = ' + data.data);
          }
        });
      })

      id = setTimeout(()=>{
        expect().assertFail();
        console.log('ACTS_StartAbility_2500 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2500 timer id : ' + id);

      await startAbilityProcess(driver, {
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
    it('ACTS_StartAbility_2700', 0, async (done:Function) => {
      console.log('ACTS_StartAbility_2700====<begin');
      let id:number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0400 Subscriber====>");
        let subscriber = data;
        commonEvent.subscribe(subscriber, (err, data)=>{
          console.debug("====>ACTS_StartAbility_2700 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2700 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2700=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, ()=>{
              console.debug("====>UnSubscribe0400 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2700 callBackSeq = ' + data.data);
          }
        });
      })
      id = setTimeout(()=>{
        expect().assertFail();
        console.log('ACTS_StartAbility_2700 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2700 timer id : ' + id);

      await startAbilityProcess(driver, {}, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
        "ohos.aafwk.param.displayId": 10,
      });
    })
  })
}