/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import{CalendarPickerModifier} from '@ohos.arkui.modifier'

@Entry
@Component
struct TimePickerPage {
  @State selectedDate: Date = new Date()
  @State isLunar: boolean = false
  @State onChangeOff: string = 'false'
  @State onDateChangeOff: string = 'false'

  @State modifier:CalendarPickerModifier = new CalendarPickerModifier().onChange((value: Date)=> {
    console.info('check003 TextPickerOnChangeModifier 单列 Picker item changed, value: ' + value )
    this.onChangeOff = 'true'
  })


  build() {
    Column() {
      Button('切换公历农历').id('changeButton')
      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .edgeAlign(CalendarAlign.END)
        .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
        .margin(10)
        .id('calendarPicker')
        .width('100%')
        .height('80%')
        .attributeModifier(this.modifier)
      Text(this.onChangeOff.toString()).key('onChangeOff')

    }
  }
}
