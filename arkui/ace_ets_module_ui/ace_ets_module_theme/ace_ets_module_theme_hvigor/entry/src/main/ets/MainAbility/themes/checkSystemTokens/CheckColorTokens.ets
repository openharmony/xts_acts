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
export class ColorsValues {
  public brand: string;
  public warning: string;
  public alert: string;
  public confirm: string;
  public fontPrimary: string;
  public fontSecondary: string;
  public fontTertiary: string;
  public fontFourth: string;
  public fontEmphasize: string;
  public fontOnPrimary: string;
  public fontOnSecondary: string;
  public fontOnTertiary: string;
  public fontOnFourth: string;
  public iconPrimary: string;
  public iconSecondary: string;
  public iconTertiary: string;
  public iconFourth: string;
  public iconEmphasize: string;
  public iconSubEmphasize: string;
  public iconOnPrimary: string;
  public iconOnSecondary: string;
  public iconOnTertiary: string;
  public iconOnFourth: string;
  public backgroundPrimary: string;
  public backgroundSecondary: string;
  public backgroundTertiary: string;
  public backgroundFourth: string;
  public backgroundEmphasize: string;
  public compForegroundPrimary: string;
  public compBackgroundPrimary: string;
  public compBackgroundPrimaryTran: string;
  public compBackgroundPrimaryContrary: string;
  public compBackgroundGray: string;
  public compBackgroundSecondary: string;
  public compBackgroundTertiary: string;
  public compBackgroundEmphasize: string;
  public compBackgroundNeutral: string;
  public compEmphasizeSecondary: string;
  public compEmphasizeTertiary: string;
  public compDivider: string;
  public compCommonContrary: string;
  public compBackgroundFocus: string;
  public compFocusedPrimary: string;
  public compFocusedSecondary: string;
  public compFocusedTertiary: string;
  public interactiveHover: string;
  public interactivePressed: string;
  public interactiveFocus: string;
  public interactiveActive: string;
  public interactiveSelect: string;
  public interactiveClick: string;

  constructor() {
    this.brand = 'sys.color.brand';
    this.warning = 'sys.color.warning';
    this.alert = 'sys.color.alert';
    this.confirm = 'sys.color.confirm';
    this.fontPrimary = 'sys.color.font_primary';
    this.fontSecondary = 'sys.color.font_secondary';
    this.fontTertiary = 'sys.color.font_tertiary';
    this.fontFourth = 'sys.color.font_fourth';
    this.fontEmphasize = 'sys.color.font_emphasize';
    this.fontOnPrimary = 'sys.color.font_on_primary';
    this.fontOnSecondary = 'sys.color.font_on_secondary';
    this.fontOnTertiary = 'sys.color.font_on_tertiary';
    this.fontOnFourth = 'sys.color.font_on_fourth';
    this.iconPrimary = 'sys.color.icon_primary';
    this.iconSecondary = 'sys.color.icon_secondary';
    this.iconTertiary = 'sys.color.icon_tertiary';
    this.iconFourth = 'sys.color.icon_fourth';
    this.iconEmphasize = 'sys.color.icon_emphasize';
    this.iconSubEmphasize = 'sys.color.icon_sub_emphasize';
    this.iconOnPrimary = 'sys.color.icon_on_primary';
    this.iconOnSecondary = 'sys.color.icon_on_secondary';
    this.iconOnTertiary = 'sys.color.icon_on_tertiary';
    this.iconOnFourth = 'sys.color.icon_on_fourth';
    this.backgroundPrimary = 'sys.color.background_primary';
    this.backgroundSecondary = 'sys.color.background_secondary';
    this.backgroundTertiary = 'sys.color.background_tertiary';
    this.backgroundFourth = 'sys.color.background_fourth';
    this.backgroundEmphasize = 'sys.color.background_emphasize';
    this.compForegroundPrimary = 'sys.color.comp_foreground_primary';
    this.compBackgroundPrimary = 'sys.color.comp_background_primary';
    this.compBackgroundPrimaryTran = 'sys.color.comp_background_primary_tran';
    this.compBackgroundPrimaryContrary = 'sys.color.comp_background_primary_contrary';
    this.compBackgroundGray = 'sys.color.comp_background_gray';
    this.compBackgroundSecondary = 'sys.color.comp_background_secondary';
    this.compBackgroundTertiary = 'sys.color.comp_background_tertiary';
    this.compBackgroundEmphasize = 'sys.color.comp_background_emphasize';
    this.compBackgroundNeutral = 'sys.color.neutral';
    this.compEmphasizeSecondary = 'sys.color.comp_emphasize_secondary';
    this.compEmphasizeTertiary = 'sys.color.comp_emphasize_tertiary';
    this.compDivider = 'sys.color.comp_divider';
    this.compCommonContrary = 'sys.color.comp_common_contrary';
    this.compBackgroundFocus = 'sys.color.comp_background_focus';
    this.compFocusedPrimary = 'sys.color.comp_focused_primary';
    this.compFocusedSecondary = 'sys.color.comp_focused_secondary';
    this.compFocusedTertiary = 'sys.color.comp_focused_tertiary';
    this.interactiveHover = 'sys.color.interactive_hover';
    this.interactivePressed = 'sys.color.interactive_pressed';
    this.interactiveFocus = 'sys.color.interactive_focus';
    this.interactiveActive = 'sys.color.interactive_active';
    this.interactiveSelect = 'sys.color.interactive_select';
    this.interactiveClick = 'sys.color.interactive_click';
  }
}
export const checkColorTokens = new ColorsValues();