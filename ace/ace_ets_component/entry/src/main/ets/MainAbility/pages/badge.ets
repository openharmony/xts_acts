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
struct BadgeExample {
  @State counts: number = 1
  @State message: string = 'new'
  @State fontSizeValue: number = 20;

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("Badge page state change called:" + JSON.stringify(eventData));
      if(eventData.data.fontSizeValue != null) {
        this.fontSizeValue = eventData.data.fontSizeValue;
      }
    }
  }

  onPageShow() {
    console.info('Badge page show called');
    var stateChangeEvent = {
      eventId: 70,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Badge({
        count: this.counts,
        maxCount: 99,
        style: { color: 0xFFFFFF, fontSize: this.fontSizeValue, badgeSize: 50, badgeColor: Color.Red }
      }) {
        Button('message')
          .onClick(() => {
            this.counts++
          })
          .width(200).height(100).backgroundColor(0x317aff).fontSize(20)
      }.width(100).height(50).key('badge')
    }.width('100%').margin({ top: 5 })
  }
}