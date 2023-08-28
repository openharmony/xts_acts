/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession'
import commonEventManager from '@ohos.commonEventManager'
import Logger from '../model/Logger'
import common from '@ohos.app.ability.common';
let context= getContext(this) as common.UIExtensionContext;
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

const TAG: string = '[UIExtAbility]'
const sleepTimeOne = 1000;

let storage = LocalStorage.GetShared()

@Entry(storage)
@Component
struct Index {
  @State message: string = 'UIExtension'
  private session: UIExtensionContentSession = storage.get<UIExtensionContentSession>('session');

  aboutToAppear() {
	let options = {
      parameters: {
        cacheDir: context.cacheDir,
        tempDir: context.tempDir,
        filesDir: context.filesDir,
        databaseDir: context.databaseDir,
        preferencesDir: context.preferencesDir,
        bundleCodeDir: context.bundleCodeDir,
        distributedFilesDir: context.distributedFilesDir,
        stageMode: context.stageMode,
        area: context.area,
        eventHub: context.eventHub
      }
    }
    commonEventManager.publish('0100_UIExtensionAbilityContext', options, (err) => {
      console.log('SUB_AA_Extension_UIServiceExtensionAbility_Context_0100 commonEventManager 0100_UIExtensionAbilityContext');
    })
    let appearEvent = 'ACTS_UIExtension_AboutToAppear';
    let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';
    let sendDataEvent = 'ACTS_UIExtension_SendData';
    let startAbilityEvent1 = 'ACTS_UIExtension_StartAbility_001';
    let startAbilityEvent2 = 'ACTS_UIExtension_StartAbility_002';
    let startAbilityEvent3 = 'ACTS_UIExtension_StartAbility_003';
    let startAbilityEvent4 = 'ACTS_UIExtension_StartAbility_004';

    let startAbilityForResultEvent1 = 'ACTS_UIExtension_StartAbilityForResult_001';
    let startAbilityForResultEvent2 = 'ACTS_UIExtension_StartAbilityForResult_002';
    let startAbilityForResultEvent3 = 'ACTS_UIExtension_StartAbilityForResult_003';
    let startAbilityForResultEvent4 = 'ACTS_UIExtension_StartAbilityForResult_004';

    var subscriber;
    var startresult = false;
    var subscribeInfo = {
      events: [startAbilityEvent1, startAbilityEvent2, startAbilityEvent3,
                    startAbilityEvent4, startAbilityForResultEvent1, 
                    startAbilityForResultEvent2, startAbilityForResultEvent3,
                    startAbilityForResultEvent4, 
                    terminateSelfWithResultEvent, sendDataEvent]
    }
    commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
      console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
      subscriber = data;

      commonEventManager.subscribe(subscriber, async (err, data) => {
        console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
        if (data.event == terminateSelfWithResultEvent) {
          this.session.terminateSelfWithResult({
            "resultCode": 0,
            "want": {
              "bundleName": "test"
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
        } else if (data.event == sendDataEvent) {
          this.session.sendData({
            name: {
              last: 'King'
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
        } else if (data.event == "terminateSelfPromise") {
          this.session.terminateSelf().then((data)=>{
            console.log(TAG + "terminateSelfPromise : " + JSON.stringify(data));
          }).catch((err)=>{
            console.log(TAG + "terminateSelfPromise : " + JSON.stringify(err));
          })
        } else if (data.event == "terminateSelfCallback") {
          this.session.terminateSelf((err, data)=>{
            console.log(TAG + "terminateSelfCallback : " + JSON.stringify(data));
          })
        } else if (data.event == "setWindowPrivacyModeFalseCallback") {
          this.session.setWindowPrivacyMode(false, (err, data)=>{
            console.log(TAG + "setWindowPrivacyModeFalseCallback : " + JSON.stringify(data));
          })
        } else if (data.event == "setWindowPrivacyModeFalsePromise") {
          this.session.setWindowPrivacyMode(false).then(()=>{
            console.log(TAG + "setWindowPrivacyModeFalsePromise : " + JSON.stringify(data));
          }).catch((err)=>{
            console.log(TAG + "setWindowPrivacyModeFalsePromise : " + JSON.stringify(err));
          })
        } else if(data.event == startAbilityEvent1) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            }, () => {
            console.log(TAG + "====>startAbilityEvent1 end====>" );
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent2) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            },
            {
              windowMode: 0
            }, () => {
            console.log(TAG + "====>startAbilityEvent2 end====>" );
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent3) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            }).then((data)=>{
              console.log(TAG + "====>startAbilityEvent3 end====>");
              console.log(TAG + "====>data is====>" + JSON.stringify(data));
            }); 
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityEvent4) {
          this.session.startAbility(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility2',
            },
            {
              windowMode: 0
           }).then((data)=>{
              console.log(TAG + "====>startAbilityEvent4 end====>");
              console.log(TAG + "====>data is====>" + JSON.stringify(data));
            });
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent1) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            }, (err,data) => {
              console.log(TAG +  "====>startAbilityForResultEvent1 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_001_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_001_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_001_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent2) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            },
            {
              windowMode: 0
            }, (err,data) => {
              console.log(TAG +  "====>startAbilityForResultEvent2 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_002_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_002_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_002_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent3) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            }).then((data) => {
              console.log(TAG +  "====>startAbilityForResultEvent3 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_003_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_003_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_003_OnResult success');
                }
              });
            }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        } else if(data.event == startAbilityForResultEvent4) {
          var flag = true
          this.session.startAbilityForResult(
            {
              bundleName: 'com.example.actsabilityusertest',
              abilityName: 'MainAbility3'
            },
            {
              windowMode: 0
            }).then((data) => {
              console.log(TAG +  "====>startAbilityForResultEvent4 end====>" + JSON.stringify(data));
              if(data.resultCode == 1 && data.want.action=='ACTION') {
                commonEventManager.publish('ACTS_UIExtension_StartAbilityForResult_004_OnResult', (err) => {
                if (err) {
                  console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_004_OnResult failed,
                    code is ${err.code}, message is ${err.message}`);
                } else {
                  console.log(TAG + 'ACTS_UIExtension_StartAbilityForResult_004_OnResult success');
                }
              });
              }
            })
            commonEventManager.unsubscribe(subscriber, async (err, data) => {
              console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
            });
        }
        
      });
    }).catch((error) => {
      console.log(TAG + "createSubscriber error : " + JSON.stringify(error));
    })
    setTimeout(async () => {
      commonEventManager.publish(appearEvent, (err) => {
        if (err) {
          Logger.log(TAG + `publish ACTS_UIExtension_AboutToAppear failed, code is ${err.code}, message is ${err.message}`);
        } else {
          Logger.log(TAG + 'publish ACTS_UIExtension_AboutToAppear success');
        }
      });
    }, sleepTimeOne);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}