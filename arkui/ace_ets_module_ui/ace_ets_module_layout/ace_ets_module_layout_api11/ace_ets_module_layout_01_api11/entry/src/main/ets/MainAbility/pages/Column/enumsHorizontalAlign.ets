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
struct RowExample {
  build() {
    Column({ space: 5 }) {
      Text('alignItems(Start)')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Column() {
        Column()
          .width('50%')
          .height(50)
          .backgroundColor(0x00FFFF)
        Column()
          .width('50%')
          .height(50)
          .backgroundColor(0xAFEEEE)
      }
      .alignItems(HorizontalAlign.Center)
      .width('90%')
      .border({ width: 1 })
    }.width('100%')
    .key('HorizontalAlign')
  }
}
