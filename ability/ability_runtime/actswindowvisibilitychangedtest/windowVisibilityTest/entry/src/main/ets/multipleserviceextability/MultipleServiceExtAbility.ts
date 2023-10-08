/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import display from '@ohos.display'
import type window from '@ohos.window'
import rpc from '@ohos.rpc';
import commonEventManager from '@ohos.commonEventManager';

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

let applicationState = 0;
let commonEventData = {
  parameters: {
    applicationState: applicationState
  }
};
const TAG: string = "ServiceExtAbilityTAG";

globalThis.GetApplicationState = async () => {
  console.info(TAG, "GetApplicationState Start!");
  let processInfo = await globalThis.multipleExtApplicationContext.getRunningProcessInformation();
  console.info(TAG, processInfo[0].pid + processInfo[0].uid + processInfo[0].processName + processInfo[0].bundleNames + processInfo[0].state);
  commonEventData.parameters.applicationState = processInfo[0].state;
  console.info(TAG, `applicationState : ${commonEventData.parameters.applicationState}`);
  commonEventManager.publish('visibilityState', commonEventData, (error) => {
    console.info("publish data : " + JSON.stringify(error));
  });
}
globalThis.createWindow = async (name, windowType, rect) => {
  let win;
  console.info(TAG, 'Start creating window.');
  let configuration = {
    name: name,
    windowType: windowType,
    ctx: globalThis.multipleExtAbilityContext
  };
  try {
    win = await window.createWindow(configuration);
    await win.moveTo(rect.left, rect.top);
    await win.resetSize(rect.width, rect.height);
    await win.loadContent('pages/uiPage1');
    await win.setBackgroundColor('#ffffffff');
    await win.show();
    console.info(TAG, 'Start creating window successfully!');
  } catch {
    console.error('Window create failed!');
  }
}
globalThis.createWindow1 = async (name, windowType, rect) => {
  let win;
  console.info(TAG, 'Start creating window.');
  let configuration = {
    name: name,
    windowType: windowType,
    ctx: globalThis.multipleExtAbilityContext
  };
  try {
    win = await window.createWindow(configuration);
    await win.moveTo(rect.left, rect.top);
    await win.resetSize(rect.width, rect.height);
    await win.loadContent('pages/uiPage2');
    await win.setBackgroundColor('#ff9ae0e0');
    await win.show();
    console.info(TAG, 'Start creating window successfully!');
  } catch {
    console.error('Window create failed!');
  }
}

class StubTest extends rpc.RemoteObject {
  // ...
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.info(TAG, `onCreate, want: ${want.abilityName}`);
    globalThis.multipleExtAbilityContext = this.context;
    globalThis.multipleExtApplicationContext = this.context.getApplicationContext();
  }

  async onRequest(want, startId) {
    console.info(TAG, `onRequest, want: ${JSON.stringify(want)}`);
    globalThis.abilityWant = want;
    await display.getDefaultDisplay().then((dis) => {
      let navigationBarRect = {
        left: 0,
        top: 0,
        width: 720,
        height: 1280
      };
      globalThis.createWindow('uiPages1', window.WindowType.TYPE_FLOAT, navigationBarRect);
    })

    await display.getDefaultDisplay().then(async (dis) => {
      let navigationBarRect = {
        left: 0,
        top: 0,
        width: 720,
        height: 1280
      };
      await globalThis.createWindow1('uiPages2', window.WindowType.TYPE_FLOAT, navigationBarRect);
      await sleep(500);
      await globalThis.GetApplicationState();

    })
  }

  onConnect(want) {
    console.info(TAG, `onConnect, want: ${want.abilityName}`);
    return new StubTest("test");
  }

  onDisconnect(want) {
    console.info(TAG, `onDisconnect, want: ${want.abilityName}`);
  }

  onDestroy() {
    console.info(TAG, `onDestroy`);
  }
}