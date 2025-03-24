/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomColors, CustomTheme } from '@ohos.arkui.theme';

class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

class CustomThemeColors implements CustomColors {
  public fontPrimary = '#ffd0a300';
  public iconSecondary = '#ffd000cd';
}

@Entry
@Component
struct TipsDialogTest {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  dialogControllerImage: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      imageSize: { width: 60, height: 60 },
      title: 'TipsDialog',
      content: '想要卸载这个APP嘛?',
      checkTips: 'checkTips',
      isChecked: true,
      checkAction: () => {
        console.log('checkAction')
      },
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
      primaryButton: {
        value: '取消',
        action: () => {
          console.info('Callback when the first button is clicked')
        },
      },
      secondaryButton: {
        value: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
      onCheckedChange: () => {
        console.info('Callback when the checkbox is clicked')
      }
    }),
  })

  build() {
    Column() {
      Button('TipsDialog')
        .width(96)
        .height(40)
        .onClick(() => {
          this.dialogControllerImage.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}