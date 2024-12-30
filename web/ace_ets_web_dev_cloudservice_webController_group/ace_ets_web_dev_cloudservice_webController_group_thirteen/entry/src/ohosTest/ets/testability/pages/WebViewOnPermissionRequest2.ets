/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear() {

  }

  build() {
    Column() {
      Web({ src: $rawfile('indexReq.html'), controller: this.controller })
        .onPermissionRequest((event) => {
          if (event) {
            // 配置Web开启调试模式
            webview.WebviewController.setWebDebuggingAccess(true);
            let atManager = abilityAccessCtrl.createAtManager();
            atManager.requestPermissionsFromUser(getContext(this), ['ohos.permission.MICROPHONE'])
              .then((data) => {
                console.info('data:' + JSON.stringify(data));
                console.info('data permissions:' + data.permissions);
                console.info('data authResults:' + data.authResults);
                LocalContext.context.eventHub.emit('WebViewOnPermissionRequest2')
              }).catch((error: BusinessError) => {
              console.error(`Failed to request permissions from user. Code is ${error.code}, message is ${error.message}`);
            })
          }
        })
    }
  }
}