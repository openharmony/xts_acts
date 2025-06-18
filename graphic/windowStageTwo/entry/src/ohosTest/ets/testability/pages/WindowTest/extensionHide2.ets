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
  @State message3: string = ''
  @State message4: string = ''
  build() {
    Column() {
      Text(this.message3 + '')
        .id('errorMessage3')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button('button1')
        .id('button3')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session2');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          extensionWindow?.hideNonSecureWindows(true).then(()=>{
            this.message3 = 'success3'
          }).catch((error: BusinessError) => {
            console.log('Failed to hideNonSecureWindows. Cause: ' + JSON.stringify(error));
            this.message3 = error.code.toString()
          });
        })
      Text(this.message4 + '')
        .id('errorMessage4')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button('button2')
        .id('button4')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
        let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session2');
        let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
        extensionWindow?.hideNonSecureWindows(false).then(()=>{
          this.message4 = 'success4'
        }).catch((error: BusinessError) => {
          console.log('Failed to hideNonSecureWindows. Cause: ' + JSON.stringify(error));
          this.message4 = error.code.toString()
        });
      })
    }.width('100%').height('100%')
  }
}