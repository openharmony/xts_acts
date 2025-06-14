/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Want } from '@kit.AbilityKit';

@Entry
@Component
struct EmbeddedComponentPage {
  @State message: string = 'Message: '
  private want: Want = {
    bundleName: 'com.example.myapplication',
    abilityName: 'ExampleEmbeddedAbility',
    parameters: {
      'ohos.extension.processMode.hostInstance': 'true',
      'reason': 'back'
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('500px')
          .height('500px')
          .onTerminated((info)=>{
            this.message = 'EmbeddedComponent1 Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error)=>{
            this.message = 'Error1: code = ' + error.code;
            console.log('EmbeddedComponent1 testOnuiExtensionLimitChange : onError ' + JSON.stringify(error))
          })
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('500px')
          .height('500px')
          .onTerminated((info)=>{
            this.message = 'EmbeddedComponent 2Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error)=>{
            this.message = 'Error2: code = ' + error.code;
            console.log('EmbeddedComponent2 testOnuiExtensionLimitChange : onError ' + JSON.stringify(error))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}