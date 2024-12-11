/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEventManager.CommonEventSubscribeInfo = {
  events: ['0100', '0110', '0120',
    '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000']
};

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

const TAG = 'Sample_AutoFillTest';

export default function abilityTest() {
  describe('GetApplicationContext', () => {
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0100
     * @tc.name   : Call the global function GetApplicationContext in ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0100', 0, async (done: Function) => {
      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.getapplicationcontexthap',
        abilityName: 'EntryAbility'
      };
      console.log(TAG, 'getAbilityDelegator end');
      await abilityDelegator.startAbility(want).then(() => {
        console.log(TAG, 'StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'StartAbility err: ' + err.code);
      })
      sleep(1000);
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 start!!!')
        let subscriber: commonEventManager.CommonEventSubscriber;
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 createSubscriber data')
          subscriber = data
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0100') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0100 success ')
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0100 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0200
     * @tc.name   : Call the global function GetApplicationContext in ts
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0200', 0, async (done: Function) => {
      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.getapplicationcontexthap',
        abilityName: 'StartAbility'
      };
      console.log(TAG, 'getAbilityDelegator end');
      await abilityDelegator.startAbility(want).then(() => {
        console.log(TAG, 'StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'StartAbility err: ' + err.code);
      })
      sleep(1000);
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 start!!!')
        let subscriber: commonEventManager.CommonEventSubscriber;
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 createSubscriber data')
          subscriber = data
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0200') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0200 success ')
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0200 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0300
     * @tc.name   : Call the global function GetApplicationContext in index.ets
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0300', 0, async (done: Function) => {
      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.getapplicationcontexthap',
        abilityName: 'EntryAbility'
      };
      console.log(TAG, 'getAbilityDelegator end');
      await abilityDelegator.startAbility(want).then(() => {
        console.log(TAG, 'StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'StartAbility err: ' + err.code);
      })
      sleep(1000);
      try {
        let subscriber: commonEventManager.CommonEventSubscriber;
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 createSubscriber data')
          subscriber = data
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0300') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 success ')
              done();
            }
          });
        });
        let driver = Driver.create();
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 start!!! = ', driver)
        await driver.delayMs(500);
        let name = await driver.findComponent(ON.id('getapplicationl1'));
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0300 name = ', name)
        await driver.delayMs(500);
        await name.click();
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0300 error: ', JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0600
     * @tc.name   : Call the global function GetApplicationContext in UIAbility
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0600', 0, async (done: Function) => {
      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.getapplicationcontexthap',
        abilityName: 'SingleStartMultipleAbility'
      };
      console.log(TAG, 'getAbilityDelegator end');
      await abilityDelegator.startAbility(want).then(() => {
        console.log(TAG, 'StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'StartAbility err: ' + err.code);
      })
      sleep(1000);
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 start!!!');
        let subscriber: commonEventManager.CommonEventSubscriber;
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0600') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0600 success');
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0600 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_GetApplicationContext_0800
     * @tc.name   : Call the global function GetApplicationContext in multi module
     * @tc.desc   : Call the global GetApplicationContext function to obtain applicationInfo and sandbox path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRuntime_GetApplicationContext_0800', 0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 start!!!')
        let subscriber: commonEventManager.CommonEventSubscriber;
        commonEventManager.createSubscriber(ACTS_CallFunction).then(async (data) => {
          console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 createSubscriber data');
          subscriber = data;
          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == '0900') {
              console.info(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 success');
              done();
            }
          });
        });
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetApplicationContext_0800 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }

      sleep(1000);
      console.log(TAG, 'StartAbility start');
      let want: Want = {
        bundleName: 'com.example.getapplicationcontexthap',
        abilityName: 'FeatureAbility'
      };
      console.log(TAG, 'getAbilityDelegator end');
      await abilityDelegator.startAbility(want).then(() => {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility successfully.');
      }).catch((err: BusinessError) => {
        console.error(TAG, 'SUB_Ability_AbilityRuntime_GetApplicationContext_0800 StartAbility err: ' + err.code);
      })
    })
  })
}