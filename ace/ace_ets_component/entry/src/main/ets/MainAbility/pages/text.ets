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
import events_emitter from '@ohos.emitter'

@Entry
@Component
struct TextExample {
  @State fontSize: number = 9
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('lineHeight')
        .fontSize(this.fontSize)
        .fontColor(0xCCCCCC)
        .key('text')
      Text($r('app.string.string_hello'))
        .fontColor($r('app.color.color_hello'))
        .fontSize($r('app.float.font_hello'))
        .key('text1')
      Image($rawfile('test.png'))
        .key('image')
    }
    .height(600)
    .width(350)
    .padding({ left: 35, right: 35, top: 35 })
  }

  onPageShow() {
    console.info('text page show called');
    var stateChangeEvent = {
      eventId: 60,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("text page state change called:" + JSON.stringify(eventData));
      if (eventData.data.fontSize != null) {
        this.fontSize = parseInt(eventData.data.fontSize);
      }
    }
  }
}
