/**
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
@Entry
@Component
struct CalendarPickerDialogExample {
  private selectedDate: Date = new Date()
  @State onDidAppearText: string = ''
  @State onDidDisappear: string = ''
  @State onWillAppear: string = ''
  @State onWillDisappear: string = ''

  build() {
    Row() {
      Column() {
        Text(this.onDidAppearText)
          .fontSize(20)
          .margin(10)
          .id('onDidAppearText')
        Text(this.onDidDisappear)
          .fontSize(20)
          .margin(10)
          .id('onDidDisappear')
        Text(this.onWillAppear)
          .fontSize(20)
          .margin(10)
          .id('onWillAppear')
        Text(this.onWillDisappear)
          .fontSize(20)
          .margin(10)
          .id('onWillDisappear')
        Button("Show CalendarPicker Dialog")
          .margin(20)
          .id('CalendarPicker')
          .onClick(() => {
            console.info("CalendarDialog.show")
            CalendarPickerDialog.show({
              selected: this.selectedDate,
              onAccept: (value) => {
                console.info("calendar onAccept:" + JSON.stringify(value))
              },
              onCancel: () => {
                console.info("calendar onCancel")
              },
              onChange: (value) => {
                console.info("calendar onChange:" + JSON.stringify(value))
              },
              onDidAppear: () => {
                this.onDidAppearText = 'onDidAppearTrigger!'
              },
              onDidDisappear: () => {
                this.onDidDisappear = 'onDidDisappearTrigger!'
              },
              onWillAppear: () => {
                this.onWillAppear = 'onWillAppearTrigger!'
              },
              onWillDisappear: () => {
                this.onWillDisappear = 'onWillDisappearTrigger!'
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}