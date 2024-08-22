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

import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';

const TAG: string = 'IndexE';

@Entry
@Component
struct Index {
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  @State message: string = 'RelyE Ability';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .size({ width: '100%', height: '50' })
          .fontWeight(FontWeight.Bold)

        UIExtensionComponent({
          bundleName: 'com.example.actsresponseglobalparamupdaterelye',
          abilityName: 'UIExtAbility',
          moduleName: 'entry',
          parameters: {
            'ability.want.params.uiExtensionType': 'sys/commonUI',
          }
        })
          .offset({ x: 0, y: 10 })
          .size({ width: 300, height: 300 })
          .border({
            width: 5,
            color: 0x317AF7,
            radius: 10,
            style: BorderStyle.Dotted
          })
        Button('PopupUIExtAbility')
          .margin(10)
          .onClick(() => {
            let pickerWant: Want = {
              bundleName: 'com.example.actsresponseglobalparamupdaterelye',
              moduleName: 'entry',
              abilityName: 'PopupUIExtAbility',
              type: 'sys/commonUI',
              parameters: {
                bundleName: 'com.example.actsresponseglobalparamupdaterelye',
                'ability.want.params.uiExtensionType': 'sys/commonUI',
              }
            };
            try {
              this.context.requestModalUIExtension(pickerWant)
                .then(() => {
                  hilog.info(0x0000, TAG, '%{public}s', 'requestModalUIExtension succeed');
                })
                .catch((err: BusinessError) => {
                  hilog.info(0x0000, TAG,
                    'requestModalUIExtension failed, Cause: %{public}s', JSON.stringify(err) ?? '');
                });
            } catch (err) {
              hilog.info(0x0000, TAG,
                'requestModalUIExtension failed, Cause: %{public}s', JSON.stringify(err) ?? '');
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}