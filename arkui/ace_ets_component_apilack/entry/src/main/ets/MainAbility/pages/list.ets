/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';

@Entry
@Component
export default
struct ListLanes {

  @State arr: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
  @State listPosition: number = 0 // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底
  private scroller: Scroller = new Scroller()


  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ListLanes start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear ListLanes end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("list-Lanes")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("lanesText")

      Text("list-AlignListItem")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("alignListItemText")

      Text("list-OnScrollBegin")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onScrollBeginText")


      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(18)

          }
          .border({ width: 2, color: Color.Green })
        }, item => item)
      }

      .height(300)
      .width("90%")
      .editMode(true)
      .border({ width: 3, color: Color.Red })
      .lanes({ minLength: 40, maxLength: 60 })
      .onScrollBegin((dx: number, dy: number) => {
        if ((this.listPosition == 0 && dy >= 0) || (this.listPosition == 2 && dy <= 0)) {
          this.scroller.scrollBy(0, -dy)
          return { dxRemain: dx, dyRemain: 0 }
        }
        this.listPosition = 1;

        return { dxRemain: dx, dyRemain: dy }

      })


    }.width("100%").height("100%")
  }
}

