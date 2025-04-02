/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, appManager, common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { hilog } from '@kit.PerformanceAnalysisKit';

let context = getContext(this) as common.UIAbilityContext;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START01',
    'ACTS_TEST_START02',
    'ACTS_TEST_START03',
    'ACTS_TEST_ONFORGROUND',
    'ACTS_TEST_ONBACKGROUND',
    'ACTS_TEST_ONDESTROYED',
    'ACTS_TEST_DESTROY'
  ]
};
let subscriber: commonEventManager.CommonEventSubscriber;

function publishCB(err: BusinessError) {
  if (err) {
    hilog.error(0x0000, 'testTag', `Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    hilog.info(0x0000, 'testTag', '%{public}s', 'publish ACTS_TEST_OPENLINK');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in publishing common event.');
  }
}

export default function startAndTerminateTest() {
  describe('startAndTerminateTest', () => {

    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100
     * @tc.name   : Within the same application and HAP package, Ability1 launches Ability2 and then terminates itself.
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100', Level.LEVEL0,(done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility01'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_START02') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext1.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200
     * @tc.name   : In the same application but different HAPs, Ability 1 launches Ability 2 and then closes itself (Ability 1).
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200', Level.LEVEL0,(done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility03'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_START02') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext3.startAbility(
                    {
                      bundleName: 'com.acts.actsstartandterminateassisttest',
                      abilityName: 'EntryAbility'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300
     * @tc.name   : Within the same application but across different HAPs, Ability 1 initiates the launch of Ability 2
     * and subsequently terminates it.
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300', Level.LEVEL0,(done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility04'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_START02') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext4.startAbility(
                    {
                      bundleName: 'com.acts.actsstartandterminateassisttest',
                      abilityName: 'EntryAbility'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });
  })
}


