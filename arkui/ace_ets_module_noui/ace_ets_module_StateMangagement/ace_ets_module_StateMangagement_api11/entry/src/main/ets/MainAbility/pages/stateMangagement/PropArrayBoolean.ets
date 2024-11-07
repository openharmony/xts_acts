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
@Component
struct PropArrayBooleanChild {
  @Prop message: Array<boolean> = [true, false, true]

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, boolean]) => {
        Text(`${item[1]} index: ${item[0]}`).fontSize(20).id('propArrayBoolean_value_' + item[0])
        Divider()
      })
      Button('init array').id('propArrayBoolean_init')
        .onClick(() => {
          this.message = [true, false, true]
        }).margin(10)

      Button('add new one').id('propArrayBoolean_add')
        .onClick(() => {
          let lastIndex = this.message.length - 1
          this.message.push(this.message[lastIndex] == true ? false : true)
        }).margin(10)

      Button('clear').id('propArrayBoolean_clear')
        .onClick(() => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(true)
          }
        }).margin(10)

      Button('delete the first one').id('propArrayBoolean_delete')
        .onClick(() => {
          this.message.shift()
        })
    }
    .width('100%')
  }
}

@Entry
@Component
struct PropArrayBoolean {
  @State message: Array<boolean> = [false, true, false]

  build() {
    Row() {
      Column() {
        PropArrayBooleanChild({ message: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}