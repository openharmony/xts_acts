/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

@Entry
@Component
struct ListPage {
  @State listItemText01: string = "OpenharmonyTest1"
  @State listItemText02: string = "OpenharmonyTest2"
  @State buttonText01: string = "testCrownBT1"
  @State buttonText02: string = "testCrownBT2"
  @State textCrown01: string = "testCrowntext1"
  @State textCrown02: string = "testCrowntext2"
  scroller: Scroller = new Scroller()
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('ListPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
  }
  build() {
    Column() {
      List() {
          ListItem() {
            Text(this.listItemText01)
              .width('30%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .focusable(true)
              .focusOnTouch(true)
              .key('listitem01')
              .onDigitalCrown((event: CrownEvent) => {
                 console.info('listItemCrown: event: ' +event)
               })
          }
          .onDigitalCrown((undefined) => {
             console.info('listItemDigitalCrown: undefined')
           })
          ListItem() {
            Text(this.listItemText02)
              .width('30%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .focusable(true)
              .focusOnTouch(true)
              .key('listitem02')
              .onDigitalCrown((undefined) => {
                 console.info('listItemCrownUndefined: undefined')
              })
          }
          .onDigitalCrown((event: CrownEvent) => {
             console.info('listItemDigitalCrown: event: ' +event)
           })
          .border({ width: 2, color: Color.Green })
      }
      .height(300)
      .width("90%")
      .border({ width: 3, color: Color.Red })
      .key("list")
      .onDigitalCrown((event: CrownEvent) => {
         console.info('listDigitalCrown: event: ' +event)
       })
      Button('testCrownBT1', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button1')
        .onDigitalCrown((event: CrownEvent) => {
           console.info('buttonDigitalCrown: event: ' +event)
         })
      Button('testCrownBT2', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button2')
        .onDigitalCrown((undefined) => {
           console.info('buttonDigitalCrown: undefined')
         })
      Text(this.textCrown01).fontSize(10).margin(5).key('text01')
      .onDigitalCrown((event: CrownEvent) => {
         console.info('textCrown: event: ' +event)
       })
      Text(this.textCrown02).fontSize(10).margin(5).key('text02')
      .onDigitalCrown((undefined) => {
         console.info('textCrown: undefined')
       })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}