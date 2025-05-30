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

import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ClickExample {
  @State text: string = '';
  sourceType: string = '';
  eventType?: string;

  build() {
    Column() {
      Button('Touch')
        .backgroundColor(0x2788D9)
        .width(100)
        .height(500)
        .fontSize(20)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === TouchType.Up) {
            this.eventType = 'Up'
          }
          if (event.type === TouchType.Move) {
            this.eventType = 'Move'
          }
          if (event.source === SourceType.Unknown) {
            this.sourceType = 'Unknown'
          }
          if (event.source === SourceType.Mouse) {
            this.sourceType = 'Mouse'
          }
          if (event.source === SourceType.TouchScreen) {
            this.sourceType = 'TouchScreen'
          }
          console.info(this.text = 'source：' + event.source);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "event": JSON.stringify(event),
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 198,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("sourceTypeTest_0100 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("sourceTypeTest_0100 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .key('button')
      Text(this.text).padding(15).fontSize(20).key('text')
    }.height(350).width('100%').padding(10)
  }
}