/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct LinkSetChild {
  @Link message: Set<number>;

  build() {
    Column() {

      Button('init set').id("LinkSet_init").height('5%')
        .onClick(() => {
          this.message = new Set([1, 2, 3])
        })

      Button('set new one').id("LinkSet_set").height('5%')
        .onClick(() => {
          this.message.add(5)
        })

      Button('clear').id("LinkSet_clear").height('5%')
        .onClick(() => {
          this.message.clear()
          if (Array.from(this.message.entries())) {
            this.message.add(0)
          }
        })

      Button('delete the first one').id("LinkSet_delete").height('5%')
        .onClick(() => {
          this.message.delete(0)
        })

      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`).fontSize(9).id("LinkSet_value_" + item[0]).height('5%')
        Divider()
      })
    }
    .width('100%')
  }
}


@Entry
@Component
struct LinkSetSample1 {
  @State message: Set<number> = new Set([1, 2, 3])

  build() {
    Row() {
      Column() {
        LinkSetChild({ message: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}