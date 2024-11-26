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
struct LinkArrayNumberChild {
  @Link value: Array<number>

  build() {
    Column() {
      ForEach(Array.from(this.value.entries()), (item: [number, number]) => {
        Text(`${item[1]}`).fontSize(20).id('LinkArrayNumber_value_' + item[0])
        Divider()
      })
      Button('child init array').id('LinkArrayNumber_init')
        .onClick(() => {
          this.value = [4, 5, 6]
        }).margin(10)

      Button('child add new one').id('LinkArrayNumber_add')
        .onClick(() => {
          let lastIndex = this.value.length - 1
          this.value.push(this.value[lastIndex] + 1)
        }).margin(10)

      Button('child clear').id('LinkArrayNumber_clear')
        .onClick(() => {
          this.value = []
          if (Array.from(this.value.entries())) {
            this.value.push(0)
          }
        }).margin(10)

      Button('child replace').id('LinkArrayNumber_replace')
        .onClick(() => {
          this.value[0] = 0
        }).margin(10)

      Button('child delete').id('LinkArrayNumber_delete')
        .onClick(() => {
          this.value.shift()
        })
    }
  }
}

@Entry
@Component
struct LinkArrayNumber {
  @State message: Array<number> = [1, 2, 3]

  build() {
    Row() {
      Column() {
        LinkArrayNumberChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}