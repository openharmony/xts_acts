/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll } from "../../../hypium/index";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';

let abilityDelegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let subscriberInfo_MainAbility:CommonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_DoAbility_Event"]
};
let mainability:UIAbility;
const START_ABILITY_TIMEOUT = 10000;
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;
const START_ABILITY_TIMEOUT_THOUSAND = 1000;
let tag = "testTag"
let subscriber:CommonEventManager.CommonEventSubscriber;
export default function abilityTest() {

  describe('ActsChangeAbilityStagetest', () => {
    beforeAll(async () =>{
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll called');
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      await Utils.msSleep(1000);
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.testapi.static")
      await Utils.msSleep(2000);
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      abilityDelegator.getCurrentTopAbility((err:BusinessError, data:UIAbility)=>{
        mainability = data as UIAbility;
      })
      await Utils.msSleep(1000);
    })
    hilog.info(0x0000, tag, '%{public}s', '====>in describe====>');

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0100
     * @tc.name    : ACTS_DoAbilityForeground_0100
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(callback)
     */
    it('ACTS_DoAbilityForeground_0100', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      hilog.info(0x0000, tag, '%{public}s', "====>in ACTS_DoAbilityForeground_0100====>");
      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let ability:UIAbility
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>UnSubscribeCallback====>");
        flag = false
        setTimeout(() => {
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.doAbilityForeground(ability, (err:BusinessError) => {
          hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0100 data:====>" + JSON.stringify(err));
          expect(err?.code).assertEqual(0);
          setTimeout(() => {
            let num:number = abilityDelegator.getAbilityState(ability)
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0100 getAbilityState:====>" + JSON.stringify(num));
            expect(num).assertEqual(2);
            CommonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0100 MainAbility2 terminateSelf");
            let abilityContextMainAbility2:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
            abilityContextMainAbility2.terminateSelf();
          }, START_ABILITY_TIMEOUT_THOUSAND)
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");
        subscriber = data;
        CommonEventManager.subscribe(subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility====> start");
        abilityDelegator.getCurrentTopAbility().then((data:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility====> success");
          ability = data
          hilog.info(0x0000, tag, '%{public}s', "===>SubscribeInfo is====>" + JSON.stringify(data?.context.abilityInfo.name));
          hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
          abilityDelegator.startAbility(
            {
              bundleName: 'com.example.testapi.static',
              abilityName: 'MainAbility2'
            }).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
          }).catch((err:BusinessError):void=>{
            hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
          })
        }).catch((error:BusinessError):void=>{
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility catch ====> " + error?.code + " " + error?.message);
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          try {
            expect().assertFail();
          } catch (error) {
            console.log(`ACTS_DoAbilityForeground_0100 startRunning failed: ${JSON.stringify(error)}`);
            done();
          }
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityForeground_0100 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0200
     * @tc.name    : ACTS_DoAbilityForeground_0200
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(callback)
     */
    it('ACTS_DoAbilityForeground_0200', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let ability:UIAbility
      hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability start");
      abilityDelegator.getCurrentTopAbility((err:BusinessError, data:UIAbility)=>{
        mainability = data as UIAbility;
        hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability success");
        ability = data as UIAbility;
        expect(data?.context.abilityInfo.name).assertEqual("EntryAbility");
        hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability data:====>" + JSON.stringify(data?.context.abilityInfo.name));
        abilityDelegator.doAbilityForeground(ability, (err:BusinessError) => {
          hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0200 data:====>" + JSON.stringify(err));
          expect(err?.code).assertEqual(0);
          setTimeout(() => {
            let num:number = abilityDelegator.getAbilityState(ability)
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0200 getAbilityState:====>" + JSON.stringify(num));
            expect(num).assertEqual(2);
          }, START_ABILITY_TIMEOUT_THOUSAND)
          setTimeout(() => {
            done()
          }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
        })
      })
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0400
     * @tc.name    : ACTS_DoAbilityForeground_0400
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(promise)
     */
    it('ACTS_DoAbilityForeground_0400', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let ability:UIAbility
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>UnSubscribeCallback====>");
        flag = false
        setTimeout(() => {
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError|null, data:CommonEventManager.CommonEventData | undefined):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.doAbilityForeground(ability).then(() => {
          hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0400 data:====>");
          expect(true).assertTrue();
          setTimeout(() => {
            let num:number = abilityDelegator.getAbilityState(ability)
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0400 getAbilityState:====>" + JSON.stringify(num));
            expect(num).assertEqual(2);
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0400 MainAbility2 terminateSelf");
            let abilityContextMainAbility2:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
            abilityContextMainAbility2.terminateSelf();
          }, START_ABILITY_TIMEOUT_THOUSAND)
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");
        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>end");
        abilityDelegator.getCurrentTopAbility().then((data:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility====>success");
          ability = data
          hilog.info(0x0000, tag, '%{public}s', "====>ability data:====>" + JSON.stringify(data?.context.abilityInfo.name));
          hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
          abilityDelegator.startAbility(
            {
              bundleName: 'com.example.testapi.static',
              abilityName: 'MainAbility2'
            }).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
          }).catch((err:BusinessError):void=>{
            hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
          })
        }).catch((error:BusinessError):void=>{
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility catch ====> " + error?.code + " " + error?.message);
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityForeground_0400 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0500
     * @tc.name    : ACTS_DoAbilityForeground_0500
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(promise)
     */
    it('ACTS_DoAbilityForeground_0500', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let ability:UIAbility
      setTimeout(() => {
        hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability start");
        abilityDelegator.getCurrentTopAbility().then((data:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability success");
          ability = data
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability data:====>" + JSON.stringify(data?.context.abilityInfo.name));
          abilityDelegator.doAbilityForeground(ability).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0500 data:====>");
            expect(true).assertTrue();
            setTimeout(() => {
              let num:number = abilityDelegator.getAbilityState(ability)
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0500 getAbilityState:====>" + JSON.stringify(num));
              expect(num).assertEqual(2);
            }, START_ABILITY_TIMEOUT_THOUSAND)
            setTimeout(() => {
              done()
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          })
        })
      }, 2000)

    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0100
     * @tc.name    : ACTS_DoAbilityBackground_0100
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(callback)
     */
    it('ACTS_DoAbilityBackground_0100', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>UnSubscribeCallback====>");
        flag = false
        setTimeout(() => {
          done();
        }, 5000)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.getCurrentTopAbility().then((ability:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability data:====>" + JSON.stringify(ability?.context.abilityInfo.name));
          abilityDelegator.doAbilityBackground(ability, (err:BusinessError) => {
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0100 data:====>");
            expect(err?.code).assertEqual(0);
            setTimeout(() => {
              let num:number = abilityDelegator.getAbilityState(ability)
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0100 getAbilityState:====>" + JSON.stringify(num));
              expect(num).assertEqual(3);
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0100 MainAbility2 terminateSelf");
              let abilityContextMainAbility2:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
              abilityContextMainAbility2.terminateSelf();
            }, START_ABILITY_TIMEOUT_THOUSAND)
            CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
          })
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");
        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
        abilityDelegator.getCurrentTopAbility().then((data:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability data:====> success" );
          abilityDelegator.startAbility(
            {
              bundleName: 'com.example.testapi.static',
              abilityName: 'MainAbility2'
            }).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
          }).catch((err:BusinessError):void=>{
                hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
              })
        }).catch((error:BusinessError):void=>{
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility catch ====> " + error?.code + " " + error?.message);
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityBackground_0100 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0500
     * @tc.name    : ACTS_DoAbilityBackground_0500
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(promise)
     */
    it('ACTS_DoAbilityBackground_0500', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>UnSubscribeCallback====>");
        flag = false
        setTimeout(() => {
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.getCurrentTopAbility().then((ability2:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2?.context.abilityInfo.name));
          abilityDelegator.doAbilityBackground(ability2).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0500 data:====>");
            expect(true).assertTrue();
            setTimeout(() => {
              let num:number = abilityDelegator.getAbilityState(ability2)
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0500 getAbilityState:====>" + JSON.stringify(num));
              expect(num).assertEqual(3);
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0500 MainAbility2 terminateSelf");
              let abilityContextMainAbility2:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
              abilityContextMainAbility2.terminateSelf();
            }, START_ABILITY_TIMEOUT_THOUSAND)
            CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
          })
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");
        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
        abilityDelegator.startAbility(
          {
            bundleName: 'com.example.testapi.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
        }).catch((err:BusinessError):void=>{
                hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
              })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityBackground_0500 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0700
     * @tc.name    : ACTS_DoAbilityBackground_0700
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(promise)
     */
    it('ACTS_DoAbilityBackground_0700', Level.LEVEL0, async (done: () => void): Promise<void> =>{

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let num1:number = 0
      let num2:number = 0
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0700 UnSubscribeCallback====>");
        flag = false
        setTimeout(()=>{
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.getCurrentTopAbility().then((ability2:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2?.context.abilityInfo.name));
          hilog.info(0x0000, tag, '%{public}s', "====>0700newabilityname:====>" + JSON.stringify(ability2.context.abilityInfo.name));
          abilityDelegator.doAbilityBackground(ability2).then(() => {
            hilog.info(0x0000, tag, '%{public}s', "====>doAbilityBackground data1:====>");
            expect(true).assertTrue();
            setTimeout(() => {
              num1 = abilityDelegator.getAbilityState(ability2)
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0700 getAbilityState1:====>" + " " + JSON.stringify(num1));
              expect(num1).assertEqual(3);
              abilityDelegator.doAbilityForeground(ability2, (err:BusinessError) => {
                hilog.info(0x0000, tag, '%{public}s', "====>doAbilityForeground data:====>" + JSON.stringify(err));
                expect(err?.code).assertEqual(0);
                setTimeout(() => {
                  num2 = abilityDelegator.getAbilityState(ability2)
                  hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0700 getAbilityState2:====>" +
                    " " + JSON.stringify(num2));
                  expect(num2).assertEqual(2);
                  abilityDelegator.doAbilityBackground(ability2).then(() => {
                    hilog.info(0x0000, tag, '%{public}s', "====>doAbilityBackground data1:====>");
                    expect(true).assertTrue();
                    setTimeout(() => {
                      num1 = abilityDelegator.getAbilityState(ability2)
                      hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0700 getAbilityState1:====>" +
                        " " + JSON.stringify(num1));
                      expect(num1).assertEqual(3);
                      abilityDelegator.doAbilityForeground(ability2, (err2:BusinessError) => {
                        hilog.info(0x0000, tag, '%{public}s', "====>doAbilityForeground data:====>");
                        expect(err2?.code).assertEqual(0);
                        setTimeout(() => {
                          num2 = abilityDelegator.getAbilityState(ability2)
                          hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0700 getAbilityState2:====>" +
                            " " + JSON.stringify(num2));
                          expect(num2).assertEqual(2);
                          ability2.context.terminateSelf();
                          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
                        }, START_ABILITY_TIMEOUT_THOUSAND)
                      })
                    }, START_ABILITY_TIMEOUT_THOUSAND)
                  })
                }, START_ABILITY_TIMEOUT_THOUSAND)
              })
            }, START_ABILITY_TIMEOUT_THOUSAND)
          })
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");

        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
        abilityDelegator.startAbility(
          {
            bundleName: 'com.example.testapi.static',
            abilityName: 'MainAbility4'
          }).then(() => {
          hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
        }).catch((err:BusinessError):void=>{
                hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
              })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityBackground_0700 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, 10000);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0800
     * @tc.name    : ACTS_DoAbilityBackground_0800
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background failed.(promise)
     */
    it('ACTS_DoAbilityBackground_0800', Level.LEVEL0, async (done: () => void): Promise<void> =>{

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let num1:number = 0
      let num2:number = 0
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0800 UnSubscribeCallback====>");
        flag = false
        setTimeout(()=>{
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityDelegator.getCurrentTopAbility().then((ability2:UIAbility) => {
          hilog.info(0x0000, tag, '%{public}s', "====>0800newabilityname:====>" + JSON.stringify(ability2.context.abilityInfo.name));
          abilityDelegator.doAbilityBackground(ability2, (err:BusinessError) => {
            hilog.info(0x0000, tag, '%{public}s', "====>doAbilityBackground data1:====>" + JSON.stringify(err));
            expect(err?.code).assertEqual(0);
            setTimeout(() => {
              num1 = abilityDelegator.getAbilityState(ability2)
              hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0800 getAbilityState1:====>" + " " + JSON.stringify(num1));
              expect(num1).assertEqual(3);
              abilityDelegator.doAbilityForeground(ability2).then(() => {
                hilog.info(0x0000, tag, '%{public}s', "====>doAbilityForeground data:====>");
                expect(true).assertTrue();
                setTimeout(() => {
                  num2 = abilityDelegator.getAbilityState(ability2)
                  hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0800 getAbilityState2:====>" +
                    " " + JSON.stringify(num2));
                  expect(num2).assertEqual(2);
                  abilityDelegator.doAbilityBackground(ability2, (err:BusinessError) => {
                    hilog.info(0x0000, tag, '%{public}s', "====>doAbilityBackground data1:====>" + JSON.stringify(err));
                    expect(err?.code).assertEqual(0);
                    setTimeout(() => {
                      num1 = abilityDelegator.getAbilityState(ability2)
                      hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0800 getAbilityState1:====>" +
                        " " + JSON.stringify(num1));
                      expect(num1).assertEqual(3);
                      abilityDelegator.doAbilityForeground(ability2).then(() => {
                        hilog.info(0x0000, tag, '%{public}s', "====>doAbilityForeground data:====>");
                        expect(true).assertTrue();
                        setTimeout(() => {
                          num2 = abilityDelegator.getAbilityState(ability2)
                          hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityBackground_0800 getAbilityState2:====>" +
                            " " + JSON.stringify(num2));
                          expect(num2).assertEqual(2);
                          ability2.context.terminateSelf();
                          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
                        }, START_ABILITY_TIMEOUT_THOUSAND)
                      })
                    }, START_ABILITY_TIMEOUT_THOUSAND)
                  })
                }, START_ABILITY_TIMEOUT_THOUSAND)
              })
            }, START_ABILITY_TIMEOUT_THOUSAND)
          })
        })
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");

        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
        abilityDelegator.startAbility(
          {
            bundleName: 'com.example.testapi.static',
            abilityName: 'MainAbility5'
          }).then(() => {
          hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
        }).catch((err:BusinessError):void=>{
                hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
              })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityBackground_0800 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, 10000);
    })

    /*
   * @tc.number  : ACTS_DoAbilityForeground_0300
   * @tc.name    : ACTS_DoAbilityForeground_0300
   * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground failed.(callback)
   */
    it('ACTS_DoAbilityForeground_0300', Level.LEVEL0, async (done: () => void): Promise<void> =>{

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let result = null
      let flag = true
      let UnSubscribeCallback = ():void => {
        hilog.info(0x0000, tag, '%{public}s', "====>UnSubscribeCallback====>");
        flag = false
        setTimeout(() => {
          done();
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
      }
      let SubscribeCallBack = (err:BusinessError | null, data:CommonEventManager.CommonEventData):void => {
        expect(data?.event == "ACTS_DoAbility_Event").assertTrue();
        hilog.info(0x0000, tag, '%{public}s', "====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        let ability3:UIAbility = AppStorage.get<UIAbility>("ability3") as UIAbility;
        hilog.info(0x0000, tag, '%{public}s', "====>0300 Subscribe CallBack globalThis.ability3:====>" + ability3?.context.abilityInfo.name);
        hilog.info(0x0000, tag, '%{public}s', "====>0300 ability3 name:====>" + JSON.stringify(ability3.context.abilityInfo.name));
        setTimeout(() => {
          abilityDelegator.doAbilityForeground(ability3, (err:BusinessError):void => {
            hilog.info(0x0000, tag, '%{public}s', "====>ACTS_DoAbilityForeground_0300 data:====>" + JSON.stringify(err));
            expect(err?.code).assertEqual(0);
          })
          hilog.info(0x0000, tag, '%{public}s', "====>0300  result:====>" + JSON.stringify(result));
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }, START_ABILITY_TIMEOUT_THOUSAND)
      }
      CommonEventManager.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, tag, '%{public}s', "====>Create Subscriber====>");
        Subscriber = data;
        CommonEventManager.subscribe(Subscriber, SubscribeCallBack);
        hilog.info(0x0000, tag, '%{public}s', "====>start startAbility====>");
        abilityDelegator.startAbility(
          {
            bundleName: 'com.example.testapi.static',
            abilityName: 'MainAbility3'
          }).then(() => {
          hilog.info(0x0000, tag, '%{public}s', "====>startAbility end====>");
        }).catch((err:BusinessError):void=>{
                hilog.info(0x0000, tag, '%{public}s', "====>startAbility catch ====> " + err?.code + " " + err?.message);
              })
      })
      let timeout= ():void => {
        if (flag == true) {
          expect().assertFail();
          hilog.info(0x0000, tag, '%{public}s', 'ACTS_DoAbilityForeground_0300 - timeout');
          CommonEventManager.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

  })
}