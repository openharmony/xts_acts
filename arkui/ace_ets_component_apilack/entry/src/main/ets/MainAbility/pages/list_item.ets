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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
export default
struct List_itemOnSelect {
  @State selectIndex:boolean = false
  @State arr: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
  @State alignListItem: ListItemAlign = ListItemAlign.Start

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear List_itemOnSelect start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear List_itemOnSelect end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("list_item-OnSelect")
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
        .key("onSelectText")

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)

          }
          .editable(true)
          .sticky(Sticky.None)
          .selectable(true)
          .key("ListItem")
          .onClick(()=> {
             console.info("ListItem onClick")
          })
          .border({ width: 2, color: Color.Green })
          .onSelect((index:boolean)=>{
            console.info("Select: " + index)
            this.selectIndex = index
            try {
              var backData = {
                data: {
                  "selectIndex": this.selectIndex
                }
              }
              let backEvent = {
                eventId: 60217,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("listItemOnSelect start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("listItemOnSelect emit action state err: " + JSON.stringify(err.message))
            }
          })
        }, item => item)
      }
      .height(300)
      .width("90%")
      .editMode(true)
      .border({ width: 3, color: Color.Red })
      .lanes({ minLength: 40, maxLength: 60 })
      //lanes(5)
      .alignListItem(this.alignListItem)
    
    }.width("100%").height("100%")
  }
}

