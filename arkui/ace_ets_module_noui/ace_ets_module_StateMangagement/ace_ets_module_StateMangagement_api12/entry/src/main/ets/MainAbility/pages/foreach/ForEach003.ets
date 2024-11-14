/**
 * Copyright (c) 2524 Huawei Device Co., Ltd.
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
@ComponentV2
struct ForEach003 {
  @Local private dataArr: string[] = []
  private isSwap: boolean = false
  private swapTemp: string = ''
  private swapStartIndex: number = -1
  private swipeStartIndex: number = -1
  private scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    for (let index = 0; index < 100; index++) {
      this.dataArr.push('item' + index)
    }
  }

  build() {
    Column({ space: 3 }) {
      Row({ space: 10 }) {
        Button('Add No.x')
          .id('btnForEach0101')
          .fontSize(14)
          .onClick(() => {
            this.dataArr.splice(5, 0, 'No.x')
          })
          .height(25)

        Button('Change short Data')
          .id('btnForEach0103')
          .fontSize(14)
          .onClick(() => {
            this.dataArr.splice(0, this.dataArr.length)
            for (let index = 0; index < 5; index++) {
              this.dataArr.push('item' + index)
            }
          })
          .height(25)
      }

      Row({ space: 10 }) {
        Button('Swipe to index0')
          .id('btnForEach0104')
          .fontSize(14)
          .onClick(() => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
            this.scroller.scrollToIndex(0); // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
          })
          .height(25)
        Button('Swipe to index45')
          .id('btnForEach0105')
          .fontSize(14)
          .onClick(() => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
            this.scroller.scrollToIndex(45); // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
          })
          .height(25)
        Button('Refresh')
          .id('btnForEach0106')
          .fontSize(14)
          .height(25)
          .onClick(()=>{
            this.dataArr.splice(0, this.dataArr.length)
            for (let index = 0; index < 100; index++) {
              this.dataArr.push('item' + index)
            }
          })
      }
      Row({ space: 10 }) {
        Button('Add No.50')
          .id('btnForEach0107')
          .fontSize(14)
          .onClick(() => {
            this.dataArr.splice(50, 0, 'No.50')
          })
          .height(25)
        Button('Reset Item10')
          .id('btnForEach0108')
          .fontSize(14)
          .onClick(() => {
            this.dataArr[9] = 'No.10'
          })
          .height(25)
      }

      List({ space: 3, scroller: this.scroller }) {
        ForEach(this.dataArr, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .fontSize(25)
          }
          .onClick(() => {
            if (!this.isSwap) {
              this.isSwap = !this.isSwap
              this.swapStartIndex = index
              this.swapTemp = item
            } else {
              this.isSwap = !this.isSwap
              this.dataArr[this.swapStartIndex] = item
              this.dataArr[index] = this.swapTemp
            }
          })
        }, (item: string) => item)
      }
      .id('listForEach010')
      .height('90%')
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start
      })
    }
  }
}