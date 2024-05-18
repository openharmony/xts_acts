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

import StartupConfig from '@ohos.app.appstartup.StartupConfig'
import StartupConfigEntry from '@ohos.app.appstartup.StartupConfigEntry'
import StartupListener from '@ohos.app.appstartup.StartupListener'
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';

export default class MyStartupConfigEntry extends StartupConfigEntry {
  onConfig() {
    hilog.info(0x000, 'StartupTest MyStartupConfigEntry TAG ', 'onConfig');
    console.log('StartupTest MyStartupConfigEntry onConfig');
    let onCompletedCallback = (error) => {
      console.log('StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
      if (error) {
        hilog.info(0x000, 'MyStartupConfigEntry TAG ', ' onCompletedCallback: %{public}d, mssage: %{public}s',
          error.code, error.mssage);
      } else {
        hilog.info(0x000, 'MyStartupConfigEntry TAG ', ' onCompletedCallback: success');
      }
      setTimeout(()=>{
        commonEventManager.publish('StartupTestDefaultConfig', {
          parameters: {
            'error': error
          }
        }, (err, data) => {
          console.log("StartupTest onCompletedCallback end, publish msg, err=" + JSON.stringify(err));
          console.log("StartupTest onCompletedCallback end, publish msg, data=" + JSON.stringify(data));
        });
      }, 500);
    }
    let startupListener: StartupListener = {
      'onCompleted': onCompletedCallback
    }
    let config: StartupConfig = {
      'timeoutMs': 5000,
      'startupListener': startupListener
    }
    return config;
  }
}