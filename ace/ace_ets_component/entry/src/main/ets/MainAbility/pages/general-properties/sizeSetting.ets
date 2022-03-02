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
struct SizeSetting {
  @State width: string = 80;
  @State height: string = 80;
  @State padding: string = 20;
  @State margin: string = 20;
  @State sizeWidth: string = '100%';
  @State sizeHeight: string = '100%';
  @State layoutWeight1: string = 1;
  @State layoutWeight2: string = 2;

  build() {
    Column({ space: 10 }) {
      Text('margin and padding:').fontSize(26).fontColor(Color.Black).width('90%')
      Row() {
        Row() {
          Row()
            .size({ width: this.sizeWidth, height: this.sizeHeight })
            .backgroundColor(0xAFEEEE)
            .key('innerRow')
        }
        .key('centerRow')
        .width(this.width)
        .height(this.height)
        .padding(this.padding)
        .margin(this.margin)
        .backgroundColor(0xFDF5E6)
      }.backgroundColor(0xFFA500)

      Text('layoutWeight')
        .fontSize(26)
        .fontColor(Color.Black)
        .width('90%')
      Row() {
        Text('layoutWeight(1)')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xFFEFD5)
          .textAlign(TextAlign.Center)
          .layoutWeight(this.layoutWeight1)
          .fontSize(20)
          .key('layoutWeight1')
        Text('layoutWeight(2)')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .layoutWeight(this.layoutWeight2)
          .fontSize(20)
          .key('layoutWeight2')
        Text('no layoutWeight')
          .size({ width: '30%', height: 110 })
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .fontSize(20)
      }.size({ width: '90%', height: 140 })
      .backgroundColor(0xAFEEEE)

      Text('constraintSize')
        .fontSize(26)
        .fontColor(Color.Black)
        .width('90%')
      Row() {
        Row()
          .constraintSize({minWidth: '10%', maxWidth: '50%', height: 70})
          .backgroundColor(0xFFA500)
        Row()
          .size({width: '30%', height:70})
          .backgroundColor(0xAFEEEE)
      }.size({ width: '90%', height: 140 })
      .backgroundColor(0xAFEEEE)
    }.width('100%').margin({ top: 5 })
  }
  onPageShow() {
    let stateChangeEvent = {
      eventId: 28,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let sizeChangeEvent = {
      eventId: 29,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(sizeChangeEvent, this.sizeChangCallBack)

    let weightChangeEvent = {
      eventId: 32,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(weightChangeEvent, this.weightChangCallBack)
  }
  stateChangCallBack = (eventData) => {
    console.info("size page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData) {
      this.width = eventData.data.width;
      this.height = eventData.data.height;
      this.padding = eventData.data.padding;
      this.margin = eventData.data.margin;
    }
  }
  sizeChangCallBack = (eventData) => {
    console.info("size page sizeChangCallBack" + JSON.stringify(eventData));
    if (eventData) {
      this.sizeWidth = eventData.data.width;
      this.sizeHeight = eventData.data.height;
    }
  }
  weightChangCallBack = (eventData) => {
    console.info("size page weightChangCallBack" + JSON.stringify(eventData));
    if (eventData) {
      this.layoutWeight1 = eventData.data.weight;
    }
  }
}