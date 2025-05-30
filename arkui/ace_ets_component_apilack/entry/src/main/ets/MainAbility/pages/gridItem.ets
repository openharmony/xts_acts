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

import Log from '../common/Log';
import events_emitter from '@ohos.events.emitter';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct GridItemOnSelect {
  @State Number: String[] = ['5', '6', '7', '8', '9']
  @State isSelect: boolean = false;

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GridItemOnSelect start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GridItemOnSelect end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("gridItem-OnSelect")
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

      Column({ space: 5 }) {
        Grid() {
          ForEach(this.Number, (day: string) => {
            ForEach(this.Number, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
                  .key("onSelected")
              }.onSelect((isSelect) => {
                console.info("Select:" + isSelect)
                //this.showToast("onSelect() " + index)
                this.isSelect = true;
                try {
                  let backData: events_emitter.EventData = {
                    data: {
                      "STATUS": this.isSelect
                    }
                  }
                  let backEvent: events_emitter.InnerEvent = {
                    eventId: 60207,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("onSelect start to emit action state")
                  events_emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info("onSelect emit action state err: " + JSON.stringify(err))
                }
              })
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .height(300)
      }
    }.width("100%").height("100%")
  }
}

