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
  @Local up: number = 0;
  @Local down: number = 0;
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
      Text('Grid include Repeat')
        .fontSize(5)
      Row() {
        Button('toTop')
          .id("toTop")
          .onClick(() => {
            this.GridScroller.scrollEdge(Edge.Top);
          })
        Button('toBottom')
          .id("toBottom")
          .onClick(() => {
            this.GridScroller.scrollEdge(Edge.Bottom);
          })
      }
      Column(){
        Text(`up num ${this.up}, down num ${this.down}`)
        Text(`${this.up - this.down}`)
      }
      Grid(this.GridScroller) {
        Repeat<DemoGridItemInfo>(this.itemList)
          .each((obj: RepeatItem<DemoGridItemInfo>) => {
            GridItem() {
              Column() {
                Image(obj.item.url)
                  .width('100%')
                Text(obj.item.name)
              }
            }
            .onAttach(() => {
              this.up++;
            })
            .onDetach(() =>{
              this.down++;
            })
          }
        )
          .virtualScroll({totalCount: this.itemList.length})
      }
      .columnsTemplate('1fr')
      .cachedCount(0)
      .height('100%')
    }
  }
}