/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct CalendarPickerDialogOptions {
  colors: (ResourceColor | null | undefined)[] = [
    Color.White, 'rgb(255, 100, 255)',0x008080,'#00FFFF', $r('app.color.blue')
  ]
  colorIndex: number = 0
  anomaliesColors: (ResourceColor | null | undefined)[] = [
    null,undefined,'XXX',-5,
  ]
  anomaliesIndex: number = 0

  bgStyles: (BlurStyle | null | undefined)[] = [
    BlurStyle.Thin,BlurStyle.Regular,BlurStyle.Thick,
    BlurStyle.BACKGROUND_THIN,BlurStyle.BACKGROUND_REGULAR, BlurStyle.BACKGROUND_THICK,BlurStyle.BACKGROUND_ULTRA_THICK,
    BlurStyle.NONE,
    BlurStyle.COMPONENT_ULTRA_THIN,BlurStyle.COMPONENT_THIN, BlurStyle.COMPONENT_REGULAR,BlurStyle.COMPONENT_THICK,
    BlurStyle.COMPONENT_ULTRA_THICK,
    undefined,null,-1,100]
  bgStyleIndex: number = 0

  shadows: (ShadowOptions | ShadowStyle)[] = [
    {
      radius: 30,
      type: ShadowType.COLOR,
      color: Color.Red,
      offsetX: 100,
      offsetY: 100,
      fill: true,
    },
    ShadowStyle.OUTER_DEFAULT_XS,
    ShadowStyle.OUTER_DEFAULT_SM,
    ShadowStyle.OUTER_DEFAULT_MD,
    ShadowStyle.OUTER_DEFAULT_LG,
    ShadowStyle.OUTER_FLOATING_SM,
    ShadowStyle.OUTER_FLOATING_MD,
  ]
  shadowIndex: number = 0

  build() {
    Column({ space: 5 }) {
      Button('CalendarPicker Dialog BGColor normal')
        .onClick(() => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            backgroundColor: this.colors[this.colorIndex],
            backgroundBlurStyle: BlurStyle.NONE,
            shadow: ShadowStyle.OUTER_FLOATING_SM,
          })
          this.colorIndex += 1
          this.colorIndex = this.colorIndex % this.colors.length
        })
        .id('showCalendarPickerButtonID')
      Button('CalendarPicker Dialog BGColor anomalies')
        .onClick(() => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            backgroundColor: this.anomaliesColors[this.anomaliesIndex],
            backgroundBlurStyle: BlurStyle.NONE,
            shadow: ShadowStyle.OUTER_FLOATING_SM,
          })
          this.anomaliesIndex += 1
          this.anomaliesIndex = this.anomaliesIndex % this.anomaliesColors.length
        })
        .id('showCalendarPickerAnomaliesButtonID')

      Button('CalendarPicker Dialog backgroundBlurStyle')
        .onClick(() => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            backgroundBlurStyle: this.bgStyles[this.bgStyleIndex],
          })
          this.bgStyleIndex += 1
          this.bgStyleIndex = this.bgStyleIndex % this.bgStyles.length
        })
        .id('showCalendarPickerBackgroundBlurStyleID')

      Button('CalendarPicker Dialog shadow')
        .onClick(() => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            shadow: this.shadows[this.shadowIndex],
          })
          this.shadowIndex += 1
          this.shadowIndex = this.shadowIndex % this.shadows.length
        })
        .id('showCalendarPickerShadowID')
    }.width('100%')
  }
}
