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
struct OpacityExample {
  @State opacityValue: string = 1;

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("opacity page state change called:" + JSON.stringify(eventData));
      if(eventData.data.opacityValue != null) {
        this.opacityValue = eventData.data.opacityValue;
      }
    }
  }

  onPageShow() {
    console.info('opacity page show called');
    var stateChangeEvent = {
      eventId: 100,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column({ space: 5 }) {
      Text('opacity(1)').fontSize(9).width('90%').fontColor(0xCCCCCC)
      Text().width('90%').height(50).opacity(`${this.opacityValue}`).backgroundColor(0xAFEEEE).key("opacity")
    }
    .width('100%')
    .padding({ top: 5 })
  }
}