/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../../../common/MessageManager';

@Entry
@Component
struct getGridItemRect2 {
  scroller: Scroller = new Scroller()
  @State arr: number[] = [0, 1, 2, 3, 4, 5]
  @State arr1: number[] = [0, 1, 2, 3, 4]
  @State columnsGap1: number = 0
  @State rowsGap1: number = 0
  @State index: number = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('getGridItemRect2 onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 }) {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.scroller.getItemRect(this.index).x
        this.y = this.scroller.getItemRect(this.index).y
        this.width1 = this.scroller.getItemRect(this.index).width
        this.height1 = this.scroller.getItemRect(this.index).height
      }).id('getGridItemRect2_button')
      Text('' + this.x).key('getGridItemRect2_text1')
      Text('' + this.y).key('getGridItemRect2_text2')
      Text('' + this.width1).key('getGridItemRect2_text3')
      Text('' + this.height1).key('getGridItemRect2_text4')

      Button('点击滚动到底部').onClick((event: ClickEvent) => {
        this.scroller.scrollTo({ xOffset: 0, yOffset: 500 })
      }).id('getGridItemRect2_button2')

      Grid(this.scroller) {
        ForEach(this.arr, (item: number) => {
          ForEach(this.arr1, (item: number) => {
            GridItem() {
              Text('' + item)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height('20%')
            .border({ width: 1 })
          }, (item: string) => item)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(this.columnsGap1)
      .rowsGap(this.rowsGap1)
      .width(300)
      .backgroundColor(0xFAEEE0)
      .height('60%')


    }.width('100%').margin({ top: 5 })
  }
}
