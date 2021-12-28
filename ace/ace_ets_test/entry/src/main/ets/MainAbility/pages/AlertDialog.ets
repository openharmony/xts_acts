/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
struct alertdialog {
  @State currentTest: string  = 'default'

  build() {
    Column() {
      Text(`${this.currentTest}`)
        .fontSize(20)

      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          AlertDialog.show({
            title: 'Title',
            message: 'This is message',
            primaryButton: {
              value: '11111111111',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          })
            .key('alertDialog')
        })
    }
    .width('100%')
    .height('100%')
  }
}