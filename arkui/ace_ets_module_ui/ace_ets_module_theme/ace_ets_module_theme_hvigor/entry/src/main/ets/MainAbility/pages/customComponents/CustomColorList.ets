/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { Theme } from '@ohos.arkui.theme';
import { DataClass } from '../themeTokensPages/SystemColorsForCheck';

export const colorTheme : string = 'theme';

@Component
export struct CustomColorList {
  @State data: DataClass[] = [];

  onWillApplyTheme(theme: Theme) {
    this.data = [
      {
        text: 'brand',
        token: theme.colors.brand,
      },
      {
        text: 'warning',
        token: theme.colors.warning,
      },
      {
        text: 'alert',
        token: theme.colors.alert,
      },
      {
        text: 'confirm',
        token: theme.colors.confirm,
      },
      {
        text: 'fontPrimary',
        token: theme.colors.fontPrimary,
      },
      {
        text: 'fontSecondary',
        token: theme.colors.fontSecondary,
      },
      {
        text: 'fontTertiary',
        token: theme.colors.fontTertiary,
      },
      {
        text: 'fontFourth',
        token: theme.colors.fontFourth,
      },
      {
        text: 'fontEmphasize',
        token: theme.colors.fontEmphasize,
      },
      {
        text: 'fontOnPrimary',
        token: theme.colors.fontOnPrimary,
      },
      {
        text: 'fontOnSecondary',
        token: theme.colors.fontOnSecondary,
      },
      {
        text: 'fontOnTertiary',
        token: theme.colors.fontOnTertiary,
      },
      {
        text: 'fontOnFourth',
        token: theme.colors.fontOnFourth,
      },
      {
        text: 'iconPrimary',
        token: theme.colors.iconPrimary,
      },
      {
        text: 'iconSecondary',
        token: theme.colors.iconSecondary,
      },
      {
        text: 'iconTertiary',
        token: theme.colors.iconTertiary,
      },
      {
        text: 'iconFourth',
        token: theme.colors.iconFourth,
      },
      {
        text: 'iconEmphasize',
        token: theme.colors.iconEmphasize,
      },
      {
        text: 'iconSubEmphasize',
        token: theme.colors.iconSubEmphasize,
      },
      {
        text: 'iconOnPrimary',
        token: theme.colors.iconOnPrimary,
      },
      {
        text: 'iconOnSecondary',
        token: theme.colors.iconOnSecondary,
      },
      {
        text: 'iconOnTertiary',
        token: theme.colors.iconOnTertiary,
      },
      {
        text: 'iconOnFourth',
        token: theme.colors.iconOnFourth,
      },
      {
        text: 'backgroundPrimary',
        token: theme.colors.backgroundPrimary,
      },
      {
        text: 'backgroundSecondary',
        token: theme.colors.backgroundSecondary,
      },
      {
        text: 'backgroundTertiary',
        token: theme.colors.backgroundTertiary,
      },
      {
        text: 'backgroundFourth',
        token: theme.colors.backgroundFourth,
      },
      {
        text: 'backgroundEmphasize',
        token: theme.colors.backgroundEmphasize,
      },
      {
        text: 'compForegroundPrimary',
        token: theme.colors.compForegroundPrimary,
      },
      {
        text: 'compBackgroundPrimary',
        token: theme.colors.compBackgroundPrimary,
      },
      {
        text: 'compBackgroundPrimaryTran',
        token: theme.colors.compBackgroundPrimaryTran,
      },
      {
        text: 'compBackgroundPrimaryContrary',
        token: theme.colors.compBackgroundPrimaryContrary,
      },
      {
        text: 'compBackgroundGray',
        token: theme.colors.compBackgroundGray,
      },
      {
        text: 'compBackgroundSecondary',
        token: theme.colors.compBackgroundSecondary,
      },
      {
        text: 'compBackgroundTertiary',
        token: theme.colors.compBackgroundTertiary,
      },
      {
        text: 'compBackgroundEmphasize',
        token: theme.colors.compBackgroundEmphasize,
      },
      {
        text: 'compBackgroundNeutral',
        token: theme.colors.compBackgroundNeutral,
      },
      {
        text: 'compEmphasizeSecondary',
        token: theme.colors.compEmphasizeSecondary,
      },
      {
        text: 'compEmphasizeTertiary',
        token: theme.colors.compEmphasizeTertiary,
      },
      {
        text: 'compDivider',
        token: theme.colors.compDivider,
      },
      {
        text: 'compCommonContrary',
        token: theme.colors.compCommonContrary,
      },
      {
        text: 'compBackgroundFocus',
        token: theme.colors.compBackgroundFocus,
      },
      {
        text: 'compFocusedPrimary',
        token: theme.colors.compFocusedPrimary,
      },
      {
        text: 'compFocusedSecondary',
        token: theme.colors.compFocusedSecondary,
      },
      {
        text: 'compFocusedTertiary',
        token: theme.colors.compFocusedTertiary,
      },
      {
        text: 'interactiveHover',
        token: theme.colors.interactiveHover,
      },
      {
        text: 'interactivePressed',
        token: theme.colors.interactivePressed,
      },
      {
        text: 'interactiveFocus',
        token: theme.colors.interactiveFocus,
      },
      {
        text: 'interactiveActive',
        token: theme.colors.interactiveActive,
      },
      {
        text: 'interactiveSelect',
        token: theme.colors.interactiveSelect,
      },
      {
        text: 'interactiveClick',
        token: theme.colors.interactiveClick,
      },
    ];
  }
  build() {
    Row() {
      Column({ space: '8vp' }) {
        ForEach(this.data, (item: DataClass) => {
          Row() {
            Blank()
              .width('15%')
              .height('20vp')
              .backgroundColor(item.token)
              .key(`${item.text}${colorTheme}`)
              .borderColor(Color.Black)
              .borderWidth('1vp')
            Text(item.text)
              .padding({ left: '8vp' })
          }
          .padding({ left: '8vp', right: '8vp' })
        }, (item: DataClass) => JSON.stringify(item.token) + item.text)
      }.alignItems(HorizontalAlign.Start)
    }
  }
}