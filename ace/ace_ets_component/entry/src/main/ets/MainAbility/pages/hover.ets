// @ts-nocheck
/**
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
struct HoverExample {
  @State isHoverVal: boolean = false
  @State hoverEffect1: HoverEffect = HoverEffect.Auto
  @State hoverEffect2: HoverEffect = HoverEffect.Board
  @State hoverEffect3: HoverEffect = HoverEffect.None

  build() {
    Column({ space: 5 }) {
      Column({ space: 5 }) {
        Text('Scale').fontSize(20).fontColor(Color.Gray).width('90%').position({ x: 0, y: 80 })
        Column()
          .width('80%').height(200).backgroundColor(Color.Gray)
          .position({ x: 40, y: 120 })
          .hoverEffect(this.hoverEffect1)
          .key('bindContextMenu')
          .onHover((isHover: boolean) => {
            console.info('Scale' + isHover)
            this.isHoverVal = isHover
          })

        Text('Board').fontSize(20).fontColor(Color.Gray).width('90%').position({ x: 0, y: 380 })
        Column()
          .width('80%').height(200).backgroundColor(Color.Gray)
          .hoverEffect(this.hoverEffect2)
          .position({ x: 40, y: 420 })
          .onHover((isHover: boolean) => {
            console.info('HoverEffect.Board')
            this.isHoverVal = isHover
          })
      }
      .hoverEffect(this.hoverEffect3)
      .width('100%').height('100%').border({ width: 1 })
      .onHover((isHover: boolean) => {
        console.info('HoverEffect.None')
        this.isHoverVal = isHover
      })
    }
  }
}