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
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct NavigationEnableHoverMode {
  @State name: string = 'NavigationEnableHoverMode';
  @State StepTips: string = '操作步骤：1、使用折叠屏手机运行测试\n2、手动折叠手机屏幕' +
    '\n' + '预期结果：MainTitle悬浮在下屏的上方位置';

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  build() {
    Navigation() {
      Column({ space: '10vp' }) {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text('enableHoverMode')

        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })
      }
    }
    .title('MainTitle', { enableHoverMode: true })
    .titleMode(NavigationTitleMode.Full)
  }
}