/*
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
struct FlexFixAtIdealSizePage {
  @State width1: number = 50
  @State height1: number = 50
  build() {
    Column() {
      Column() {
        Text('fixAtIdealSize')
        // fixAtIdealSize生效时，当前组件会与其子组件大小相等，宽度不可超过父组件（100vp）,高度可超过父组件（80vp）
        // 但会受自身constraintSize（150vp * 100vp）约束
        // 因此当width1=160、height1=120时， Flex组件大小为100vp * 100vp
        Flex() {
          Flex().width(this.width1).height(this.height1)
        }
        .id('FlexFixAtIdealSizePage_Flex')
        .backgroundColor(Color.Pink)
        .width(LayoutPolicy.fixAtIdealSize)
        .height(LayoutPolicy.fixAtIdealSize)
        .constraintSize({ maxWidth: 150, maxHeight: 100 })
      }.width(100).height(80)

      Button('w=160 h=120').onClick(() => {
        this.width1 = 160
        this.height1 = 120
      }).id('FlexFixAtIdealSizePage_Btn').padding({top: 10})

    }.width('100%').height('100%')
  }
}
