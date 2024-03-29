/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { CustomContainer } from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';
import screenLock from '@ohos.screenLock';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct ScreenLock {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'ScreenLock';
  @State StepTips: string = '操作步骤：点击锁屏按钮' + '\n' + '预期结果：上滑设备解锁，如果设置了锁屏密码则需要输入密码进入设备';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Row() {
            Button('锁屏')
              .fontSize(28)
              .onClick(() => {
                this.Vue = true
                screenLock.lock().then((data: Boolean) => {
                  console.info(`Succeeded in locking the screen. result: ${data}`);
                }).catch((err: BusinessError) => {
                  console.error(`Failed to lock the screen, Code: ${err.code}, message: ${err.message}`);
                });
              })
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('100%')
        }
      }
      .scrollBarWidth('6vp')
      .scrollBarColor('#cccccc')
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.Black)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/Screen/Screen_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        FillColor: $FillColor,
        X: $X,
        name: $name,
        Vue: $Vue,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Screen/Screen_index',
    })
  }
}