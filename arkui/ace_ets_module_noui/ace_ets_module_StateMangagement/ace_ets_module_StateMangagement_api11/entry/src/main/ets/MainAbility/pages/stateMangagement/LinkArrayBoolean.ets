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
struct LinkArrayBooleanChild {
  @Link value: Array<boolean>

  build() {
    Column() {
      ForEach(Array.from(this.value.entries()), (item: [number, boolean]) => {
        Text(`${item[1]} index:${item[0]}`).fontSize(20).id('LinkArrayBoolean_value_' + `${item[0]}`)
        Divider()
      })

      Button('child init array').id('LinkArrayBoolean_init')
        .onClick(() => {
          this.value = [false, true, false]
        }).margin(10)

      Button('child add new one').id('LinkArrayBoolean_add')
        .onClick(() => {
          let lastIndex = this.value.length - 1
          this.value.push(this.value[lastIndex] == true ? false : true)
        }).margin(10)

      Button('child clear').id('LinkArrayBoolean_clear')
        .onClick(() => {
          this.value = []
          if (Array.from(this.value.entries())) {
            this.value.push(true)
          }
        }).margin(10)

      Button('child replace').id('LinkArrayBoolean_replace')
        .onClick(() => {
          this.value[0] = this.value[0] == true ? false : true
        }).margin(10)

      Button('child delete').id('LinkArrayBoolean_delete')
        .onClick(() => {
          this.value.shift()
        })
    }
  }
}

@Entry
@Component
struct LinkArrayBoolean {
  @State message: Array<boolean> = [true, false, true]

  build() {
    Row() {
      Column() {
        LinkArrayBooleanChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}