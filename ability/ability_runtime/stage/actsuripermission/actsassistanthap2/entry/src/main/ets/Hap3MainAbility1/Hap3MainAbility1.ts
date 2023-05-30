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

import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';
import fs from '@ohos.file.fs'

function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time))
}

export default class Hap3MainAbility1 extends Ability {
  onCreate(want, launchParam) {
    console.log('[Demo] Hap3MainAbility1 onCreate')
    globalThis.abilityWant = want;
  }

  onDestroy() {
    console.log('[Demo] Hap3MainAbility1 onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.log('[Demo] Hap3MainAbility1 onWindowStageCreate')
    windowStage.setUIContent(this.context, 'pages/Hap3MainAbility1_pages', null)
  }

  onWindowStageDestroy() {
    console.log('[Demo] Hap3MainAbility1 onWindowStageDestroy')
  }

  onForeground() {
    console.log('[Demo] Hap3MainAbility1 onForeground')
    let eventName : string = 'TerminateNotify_Hap3MainAbility1';
    let subscribeInfo = {
      events: [eventName]
    }
    let subscriber_1;
    function UnSubscribeInfoCallback_1(err, data) {
      console.info("Hap2MainAbility1 ===UnSubscribeInfoCallback_1===")
    }

    async function SubscribeCallBackContext(err, data) {
      console.log('Hap3MainAbility1 Subscribe CallBack data:' + JSON.stringify(data));
      if (data.event === eventName) {
        await sleep(1000);
        let uri : string = globalThis.abilityWant.uri;
        if (uri == null) {
          console.log('[Demo] Hap3MainAbility1 uri is invalid');
          return;
        }
        console.info('[Demo] Hap3MainAbility1 uri is ' + JSON.stringify(uri));
        let eventName13_1 : string = 'Temp_UriPermissionTest_1300_Read_Successfully';
        let eventName13_2 : string = 'Temp_UriPermissionTest_1300_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName13_1, (err) => {
            console.log('Hap3MainAbility1' + eventName13_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName13_2, (err) => {
            console.log('Hap3MainAbility1' + eventName13_2);
          });
        });

        let eventName13_3 : string = 'Temp_UriPermissionTest_1300_Write_Successfully';
        let eventName13_4 : string = 'Temp_UriPermissionTest_1300_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName13_3, (err) => {
            console.log('Hap3MainAbility1' + eventName13_3);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName13_4, (err) => {
            console.log('Hap3MainAbility1' + eventName13_4);
          });
        });
      }
      commonEvent.unsubscribe(subscriber_1, UnSubscribeInfoCallback_1)
    }

    commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
      subscriber_1 = data;
      console.debug('====>Create Subscriber====>');
      await commonEvent.subscribe(subscriber_1, SubscribeCallBackContext);
    });

    let eventName1 : string = 'RevicedFrom_Hap3MainAbility1';
    commonEvent.publish(eventName1, (err) => {
      console.log('Hap3MainAbility1' + eventName1);
    });
  }

  onBackground() {
    console.log('[Demo] Hap3MainAbility1 onBackground')
  }
};
