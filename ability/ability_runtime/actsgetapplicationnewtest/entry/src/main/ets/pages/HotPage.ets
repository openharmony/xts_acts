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
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';

@Entry
@Component
struct HotStartAbility {
  context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
  @State message: string = '';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('热启动')
          .id('change1')
          .margin(10)
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            let TAG = 'Test';
            let want: Want = {
              'bundleName': 'com.example.contexttest',
              'abilityName': 'EntryAbility'
            };
            this.context.startAbility(want, (error) => {
              console.log(TAG, 'start ability error.code = ' + error.code);
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}