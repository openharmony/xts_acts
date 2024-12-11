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
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import application from '@ohos.app.ability.application';
import commonEventManager from '@ohos.commonEventManager';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import appManager from '@ohos.app.ability.appManager';
import common from '@ohos.app.ability.common';

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class HotStartAbility extends UIAbility {

  onCreate(want:Want, launchParam){
    hilog.info(0x0000, 'testTag', 'HotStartAbility onCreate');
    let applicationContext = this.context.getApplicationContext();
    applicationContext.setSupportedProcessCache(true);

    let applicationStateObserver: appManager.ApplicationStateObserver = {
      onForegroundApplicationChanged: (appStateData: appManager.AppStateData): void => {
        hilog.info(0x0000, 'testTag', `onForegroundApplicationChanged onForegroundApplicationChanged ${JSON.stringify(appStateData)}`);
        try {
          let context1 = application.getApplicationContext();
          hilog.info(0x0000, 'testTag', '0700 context1: %{public}s', JSON.stringify(context1));
          commonEventManager.publish('0700', (err, data)=>{
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, err=' + JSON.stringify(err));
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, data=' + JSON.stringify(data));
          })
        } catch (err) {
          hilog.info(0x0000, 'testTag', '0700 err: %{public}s', JSON.stringify(err));
        }
      },
      onAbilityStateChanged: (abilityStateData: appManager.AbilityStateData): void => {
        hilog.info(0x0000, 'testTag', `HotStartAbility onAbilityStateChanged ${JSON.stringify(abilityStateData)}`);
        try {
          let context1 = application.getApplicationContext();
          hilog.info(0x0000, 'testTag', '0700 context1: %{public}s', JSON.stringify(context1));
          commonEventManager.publish('0700', (err, data)=>{
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, err=' + JSON.stringify(err));
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, data=' + JSON.stringify(data));
          })
        } catch (err) {
          hilog.info(0x0000, 'testTag', '0700 err: %{public}s', JSON.stringify(err));
        }
      },
      onProcessCreated: (processData: appManager.ProcessData): void => {
        hilog.info(0x0000, 'testTag', `0700 HotStartAbility onProcessCreated `);
        try {
          let context1 = application.getApplicationContext();
          hilog.info(0x0000, 'testTag', '0700 context1: %{public}s', JSON.stringify(context1));
          commonEventManager.publish('0700', (err, data)=>{
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, err=' + JSON.stringify(err));
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, data=' + JSON.stringify(data));
          })
        } catch (err) {
          hilog.info(0x0000, 'testTag', '0700 err: %{public}s', JSON.stringify(err));
        }
      },
      onProcessDied: (processData: appManager.ProcessData): void => {
        hilog.info(0x0000, 'testTag', `HotStartAbility onProcessDied `);
      },
      onProcessStateChanged: (processData: appManager.ProcessData): void => {
        hilog.info(0x0000, 'testTag', `HotStartAbility onProcessStateChanged `);
        try {
          let context1 = application.getApplicationContext();
          hilog.info(0x0000, 'testTag', '0700 context1: %{public}s', JSON.stringify(context1));
          commonEventManager.publish('0700', (err, data)=>{
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, err=' + JSON.stringify(err));
            hilog.info(0x0000, 'testTag', '0700 customData, publish msg, data=' + JSON.stringify(data));
          })
        } catch (err) {
          hilog.info(0x0000, 'testTag', '0700 err: %{public}s', JSON.stringify(err));
        }
      },
      onAppStarted: (appStateData: appManager.AppStateData): void => {
        hilog.info(0x0000, 'testTag', `HotStartAbility onAppStarted `);
      },
      onAppStopped: (appStateData: appManager.AppStateData): void => {
        hilog.info(0x0000, 'testTag', `HotStartAbility onAppStopped `);
      }
    };
    try {
      let observerId = appManager.on('applicationState', applicationStateObserver);
      hilog.info(0x0000, 'testTag', `HotStartAbility appManager.on applicationState success`);
    } catch (e) {
      hilog.info(0x0000, 'testTag', `HotStartAbility appManager.on applicationState error: ${JSON.stringify(e)}`);
    }
  }

  onDestroy(){
    hilog.info(0x0000, 'testTag ', 'HotStartAbility onDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag ', 'HotStartAbility onNewWant');
    try {
      hilog.info(0x0000, 'testTag', 'Ability onCreate');
      let context1 = application.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
      let context2 = getContextEntry().getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context2: %{public}s', JSON.stringify(context2));
      if (context1.applicationInfo.name == context2.applicationInfo.name &&
          context1.cacheDir == context2.cacheDir &&
          context1.tempDir == context2.tempDir &&
          context1.filesDir == context2.filesDir &&
          context1.databaseDir == context2.databaseDir &&
          context1.preferencesDir == context2.preferencesDir &&
          context1.bundleCodeDir == context2.bundleCodeDir &&
          context1.distributedFilesDir == context2.distributedFilesDir &&
          context1.resourceDir == context2.resourceDir &&
          context1.cloudFileDir == context2.cloudFileDir
      ) {
        commonEventManager.publish('0700', (err, data)=>{
          hilog.info(0x0000, 'testTag', 'customData, 0700 msg, err=' + JSON.stringify(err));
          hilog.info(0x0000, 'testTag', 'customData, 0700 msg, data=' + JSON.stringify(data));
        })
      } else {
        hilog.info(0x0000, 'testTag', '0700 context1 failed');
      }
    } catch (err) {
      hilog.info(0x0000, 'testTag', '0700 context1: %{public}s', JSON.stringify(err));
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', 'HotStartAbility onWindowStageCreate');

    windowStage.loadContent('pages/HotPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground(){
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', 'HotStartAbility onForeground');
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'testTag', 'HotStartAbility onBackground');
  }
}
