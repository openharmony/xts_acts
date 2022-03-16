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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ClickExample {
  @State text: string = '';
  @State onClickValue: boolean = false;

  build() {
    Column() {
      Button('Click').backgroundColor(0x2788D9).width(200).height(100).fontSize(20)
        .onClick((event: ClickEvent) => {
          console.info(this.text = 'Click Point:' + '\n  screenX:' + event.screenX + '\n  screenY:' + event.screenY
          + '\n  x :' + event.x + '\n  y:' + event.y + '\ntarget:' + '\n  component globalPos：（'
          + event.target.area.globalPos.x + ',' + event.target.area.globalPos.y + '）\n  width:'
          + event.target.area.width + '\n  height：' + event.target.area.height);
          this.onClickValue = true;
          try {
            var backData = {
              data: {
                "ACTION": this.onClickValue,
                "event": JSON.stringify(event)
              }
            }
            var backEvent = {
              eventId: 30,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("click action state err: " + JSON.stringify(err.message))
          }
        }).key('button')
      Text(this.text).padding(15).fontSize(20).key('text')
    }.height(350).width('100%').padding(10)
  }
}