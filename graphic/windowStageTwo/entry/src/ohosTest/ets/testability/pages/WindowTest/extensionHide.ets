/**
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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { uiExtension, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Extension {
  @State message1: string = ''
  @State message2: string = ''
  build() {
    Column() {
      Text(this.message1 + '')
        .id('errorMessage1')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button('button1')
        .id('button1')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          extensionWindow?.hideNonSecureWindows(true).then(()=>{
            this.message1 = 'success1'
          }).catch((error: BusinessError) => {
            console.log('Failed to hideNonSecureWindows. Cause: ' + JSON.stringify(error));
            this.message1 = error.code.toString()
          });
        })
      Text(this.message2 + '')
        .id('errorMessage2')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button('button2')
        .id('button2')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
        let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
        let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
        extensionWindow?.hideNonSecureWindows(false).then(()=>{
          this.message2 = 'success2'
        }).catch((error: BusinessError) => {
          console.log('Failed to hideNonSecureWindows. Cause: ' + JSON.stringify(error));
          this.message2 = error.code.toString()
        });
      })
    }.width('100%').height('100%')
  }
}