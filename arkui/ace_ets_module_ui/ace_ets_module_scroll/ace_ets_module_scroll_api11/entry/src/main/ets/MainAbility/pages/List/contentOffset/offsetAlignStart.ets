
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
struct contentOffsetSnapAlignSTART {
  scroller: Scroller = new Scroller;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Column(){
      Text('scrollSnapAlign START')
      List({ space: 10, initialIndex: 5, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('ListItem' + item)
              .width('90%')
              .height(100)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .id('align_startOffset_start_' + item)
        }, (item: number) => JSON.stringify(item))
      }
      .id('align_startOffset_start')
      .chainAnimation(true)
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor(Color.Yellow)
      .height('100%')
      .height('40%')
      .scrollSnapAlign(ScrollSnapAlign.START)
      .contentStartOffset(10)
      .contentEndOffset(10)

      Column() {
        Row() {
          Button('scroll Top')
            .id('scroll_align_offset_top')
            .fontSize(14)
            .margin(5)
            .onClick(() => {
              this.scroller.scrollEdge(Edge.Top)
            })
        }
      }
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin({ top: 5 })
  }
}