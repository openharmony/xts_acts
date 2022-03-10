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
import events_emitter from '@ohos.emitter';

@Entry
@Component
struct ButtonExample {
  @State buttonTypeValue: ButtonType = ButtonType.Normal;
  @State fontSizeValue: number = 20;

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("Button page state change called:" + JSON.stringify(eventData));
      if (eventData.data.fontSizeValue != null) {
        this.fontSizeValue = eventData.data.fontSizeValue;
      }
      if (eventData.data.buttonTypeValue != null) {
        this.buttonTypeValue = eventData.data.buttonTypeValue;
      }
    }
  }

  onPageShow() {
    console.info('Button page show called');
    var stateChangeEvent = {
      eventId: 80,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    var stateChangeEvent = {
      eventId: 81,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
       Button('Ok', { type: this.buttonTypeValue, stateEffect: true })
          .borderRadius(8).backgroundColor(0x317aff).width(90).key('button')
       Button('ok').type(`${this.buttonTypeValue}`).key('button1')
          .backgroundColor(0x317aff).width(90)
       Button('ok').type(this.buttonTypeValue).key('button2').fontSize(this.fontSizeValue)
          .backgroundColor(0x317aff).width(90)
    }.height(400).padding({ left: 35, right: 35, top: 35 })
  }
}