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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';

let START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
let UPDATE_WANT_EVENT = "update_want_event";
let FOREGROUND_EVENT = "foreground_event"
let tag = '[ACTS_StartAbilityInNewProcess EntryAbility]';
let commonEventData = {
  parameters: {
    num: -1
  }
};

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.log(`${tag} onCreate, ${JSON.stringify(want)}`);
  }

  onDestroy() {
    console.log(`${tag} onDestroy`);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log(`${tag} onWindowStageCreate`);

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
  }

  async onForeground() {
    console.log(`${tag} onForeground`);
    let subscribeInfo = {
      events: [UPDATE_WANT_EVENT],
    };
    let subscriber = await commonEvent.createSubscriber(subscribeInfo);
    commonEvent.subscribe(subscriber, (err, data) => {
        console.log(`${tag} data: ${JSON.stringify(data)}}`);
        switch (data.event) {
          case UPDATE_WANT_EVENT: {
            this.startInNewProcess(data);
            if (data.parameters['isDone'] as number == 1) {
              commonEvent.unsubscribe(subscriber, (err, data) => {
                console.info(`${tag} unsubscribe success`);
              })
            }
          }
          break;
          default:
            break;
        }
    });
    commonEvent.publish(FOREGROUND_EVENT, (err)=>{
      console.log(`${tag} publish FOREGROUND_EVENT err: ${JSON.stringify(err)}`);
    });
  }

  onBackground() {
    console.log(`${tag} onBackground`);
  }

  startInNewProcess(data) {
    let want: Want = {
      deviceId: '',
      bundleName: data.parameters['acts_bundleName'] as string,
      abilityName: data.parameters['acts_abilityName'] as string
    };
    let options: StartOptions = {
      processMode: data.parameters['acts_processMode'] as number,
      startupVisibility: data.parameters['acts_startupVisibility'] as number
    };
    if (data.parameters['acts_processMode'] == undefined) {
      delete options.processMode;
    }
    if (data.parameters['acts_startupVisibility'] == undefined) {
      delete options.startupVisibility;
    }
    console.log(`${tag} startInNewProcess options: ${JSON.stringify(options)}`);

    try {
      this.context.startAbility(want, options, (err: BusinessError) => {
        commonEventData.parameters.num = err.code;
        commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
          console.log(`${tag} publish err: ${JSON.stringify(err)}`);
        });
        if (err.code) {
          console.log(`${tag} startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.log(`${tag} startAbility succeed`);
      });
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`startAbility failed, code is ${code}, message is ${message}`);
      commonEventData.parameters.num = code;
      commonEvent.publish(START_ABILITY_IN_NEW_PROCESS_EVENT, commonEventData, (err)=>{
        console.log(`${tag} publish err: ${JSON.stringify(err)}`);
      });
    }
  }
}
