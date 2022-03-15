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
struct ClipAndMaskExample {
  @State isMaskRect: boolean = true;
  @State isClipCircle:boolean = true;

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.isMaskReact = eventData.data.maskValue;
      }
    }
  }

  private shapeChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page shape change called:" + JSON.stringify(eventData));
      if(eventData.data.clipValue != null) {
        this.isClipCircle = eventData.data.clipValue;
      }
    }
  }

  onPageShow() {
    console.info('shapeClipping page show called');
    var stateChangeEvent = {
      eventId: 99,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    var shapeChangeEvent = {
      eventId: 98,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(shapeChangeEvent, this.shapeChangCallBack);
  }

  build() {
    Column({ space: 5 }) {
      Text('clip')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)

      if (this.isClipCircle) {
        Image('/images/clip.png')
          .clip(new Circle({ width: 80, height: 80 }))
          .width('500px')
          .height('280px')
          .key('image_clip')
      } else {
        Image('/images/clip.png')
          .clip(new Rect({ width: 80, height: 60 }))
          .width('500px')
          .height('280px')
          .key('image_clip')
      }

      Row() {
        Image('/images/clip.png')
          .width('500px')
          .height('280px')
      }
      .clip(true)
      .borderRadius(20)
      .key('image_clip_true')

      Text('mask')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)

      if (this.isMaskRect) {
        Image('/images/clip.png')
          .mask(new Rect({ width: '500px', height: '280px' }).fill(Color.Grey))
          .width('500px').height('280px')
          .key('image_mask')
      } else {
        Image('/images/clip.png')
          .mask(new Circle({ width: '280px', height: '280px' }).fill(Color.Grey))
          .width('500px').height('280px')
          .key('image_mask')
      }
    }
    .width('100%')
    .margin({ top: 5 })
  }
}