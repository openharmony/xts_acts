/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { CustomTheme } from '@ohos.arkui.theme';
import { redCustomTheme } from '../../themes/CustomTheme';

export const progressThemeProperty = 'ProgressThemeProperty';

export class ProgressKeys {
  public static readonly progressLinearSystem: string = `Progress_Linear_System`;
  public static readonly progressRingSystem: string = `Progress_Ring_System`;
  public static readonly progressEclipseSystem: string = `Progress_Eclipse_System`;
  public static readonly progressScaleSystem: string = `Progress_Scale_System`;
  public static readonly progressCapsuleSystem: string = `Progress_Capsule_System`;
  public static readonly progressLinearUndefinedTheme: string = `Progress_Linear_Undefined_WithTheme`;
  public static readonly progressRingUndefinedTheme: string = `Progress_Ring_Undefined_WithTheme`;
  public static readonly progressEclipseUndefinedTheme: string = `Progress_Eclipse_Undefined_WithTheme`;
  public static readonly progressScaleUndefinedTheme: string = `Progress_Scale_Undefined_WithTheme`;
  public static readonly progressCapsuleUndefinedTheme: string = `Progress_Capsule_Undefined_WithTheme`;
  public static readonly progressLinearTheme: string = `Progress_Linear_WithTheme`;
  public static readonly progressRingTheme: string = `Progress_Ring_WithTheme`;
  public static readonly progressEclipseTheme: string = `Progress_Eclipse_WithTheme`;
  public static readonly progressScaleTheme: string = `Progress_Scale_WithTheme`;
  public static readonly progressCapsuleTheme: string = `Progress_Capsule_WithTheme`;
}

@Entry
@Component
struct ProgressPage {
  @StorageLink(progressThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  value: number = 40;
  total: number = 100;

  build() {
    Column() {
      Progress({ value: this.value, total: this.total, type: ProgressType.Linear })
        .key(ProgressKeys.progressLinearSystem)
        .width('90%')
        .margin({ top: 10 })
      Row() {
        Progress({ value: this.value, total: this.total, type: ProgressType.Ring })
          .key(ProgressKeys.progressRingSystem)
          .margin({ left: 10 })
        Progress({ value: this.value, total: this.total, type: ProgressType.Eclipse })
          .key(ProgressKeys.progressEclipseSystem)
          .margin({ left: 10 })
        Progress({ value: this.value, total: this.total, type: ProgressType.ScaleRing })
          .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
          .key(ProgressKeys.progressScaleSystem)
          .margin({ left: 10 })
      }
      .width('90%')
      .margin({ top: 10 })
      Progress({ value: this.value, total: this.total, type: ProgressType.Capsule })
        .style({ borderWidth: 5, enableScanEffect: false, showDefaultPercentage: false })
        .key(ProgressKeys.progressCapsuleSystem)
        .width('90%')
        .margin({ top: 10 })

      WithTheme({ theme: undefined }) {
        Column() {
          Progress({ value: this.value, total: this.total, type: ProgressType.Linear })
            .key(ProgressKeys.progressLinearUndefinedTheme)
            .width('90%')
            .margin({ top: 10 })
          Row() {
            Progress({ value: this.value, total: this.total, type: ProgressType.Ring })
              .key(ProgressKeys.progressRingUndefinedTheme)
              .margin({ left: 10 })
            Progress({ value: this.value, total: this.total, type: ProgressType.Eclipse })
              .key(ProgressKeys.progressEclipseUndefinedTheme)
              .margin({ left: 10 })
            Progress({ value: this.value, total: this.total, type: ProgressType.ScaleRing })
              .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
              .key(ProgressKeys.progressScaleUndefinedTheme)
              .margin({ left: 10 })
          }
          .width('90%')
          .margin({ top: 10 })
          Progress({ value: this.value, total: this.total, type: ProgressType.Capsule })
            .style({ borderWidth: 5, enableScanEffect: false, showDefaultPercentage: false })
            .key(ProgressKeys.progressCapsuleUndefinedTheme)
            .width('90%')
            .margin({ top: 10 })
        }
      }

      WithTheme({ theme: this.localTheme }) {
        Column() {
          Progress({ value: this.value, total: this.total, type: ProgressType.Linear })
            .key(ProgressKeys.progressLinearTheme)
            .width('90%')
            .margin({ top: 10 })
          Row() {
            Progress({ value: this.value, total: this.total, type: ProgressType.Ring })
              .key(ProgressKeys.progressRingTheme)
              .margin({ left: 10 })
            Progress({ value: this.value, total: this.total, type: ProgressType.Eclipse })
              .key(ProgressKeys.progressEclipseTheme)
              .margin({ left: 10 })
            Progress({ value: this.value, total: this.total, type: ProgressType.ScaleRing })
              .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
              .key(ProgressKeys.progressScaleTheme)
              .margin({ left: 10 })
          }
          .width('90%')
          .margin({ top: 10 })
          Progress({ value: this.value, total: this.total, type: ProgressType.Capsule })
            .style({ borderWidth: 5, enableScanEffect: false, showDefaultPercentage: false })
            .key(ProgressKeys.progressCapsuleTheme)
            .width('90%')
            .margin({ top: 10 })
        }
      }
    }
    .width('100%')
  }
}