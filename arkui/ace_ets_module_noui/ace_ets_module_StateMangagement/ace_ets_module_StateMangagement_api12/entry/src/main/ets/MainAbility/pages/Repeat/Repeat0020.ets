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

@ObservedV2
class DemoGridItemInfo {
  @Trace name: string;
  @Trace url: string;
  constructor(name: string, url: string) {
    this.name = name;
    this.url = url;
  }
}

@Entry
@ComponentV2
struct Repeat0020 {
  @Local itemList: Array<DemoGridItemInfo> = [];
  @Local swipeStartIndex: number = -1;
  @Local repeat0020_1: string = "-1";
  @Local repeat0020_2: string = "-1";
  private imagesUrl: Array<string> = [
    "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/launch/241126/plp/phones/new/huawei-phones-ai.jpg",
    "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/launch/241126/plp/phones/new/huawei-phones-camera.jpg",
    "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/launch/250320/plp/phones/pura-x-design.jpg",
    "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/plp/new-phones/images/reason/huawei-phones-communication.jpeg"
  ]
  private GridScroller: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.itemList.push(new DemoGridItemInfo("img" + i, this.imagesUrl[i % 4]));
    }
  }

  build() {
    Column({space: 10}) {
      Column() {
        Button('toIndex[2]')
          .id("toIndex[2]")
          .onClick(() => {
            let rect = this.GridScroller.getItemRect(this.swipeStartIndex);
            this.GridScroller.scrollToIndex(2)
            this.GridScroller.scrollBy(0, -rect.y);
          })
        Text(this.repeat0020_1)
          .id("repeat0020_1")
        Text(this.repeat0020_2)
          .id("repeat0020_2")
      }

      Grid(this.GridScroller) {
        Repeat<DemoGridItemInfo>(this.itemList)
          .each((obj: RepeatItem<DemoGridItemInfo>) => {
            GridItem() {
              Stack() {
                Image(obj.item.url)
                Text(obj.item.name)
                  .backgroundColor(Color.White)
                  .border({width: 10})
              }
            }
            .height("50%")
            .margin(10)
            .onAttach(() => {
              this.repeat0020_2 = obj.item.name;
            })
            .onDetach(() =>{
              this.repeat0020_1 = obj.item.name;
            })
          }
          )
          .virtualScroll({totalCount: this.itemList.length})
      }
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start;
      })
      .columnsTemplate('1fr')
      .cachedCount(0)
      .height('100%')
    }
  }
}