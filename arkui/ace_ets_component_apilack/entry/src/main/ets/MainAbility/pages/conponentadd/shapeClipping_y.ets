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
struct ClipAndMaskExample {
  @State isMaskRect: boolean = true;
  @State isClipCircle:boolean = true;
  @State maskType: CommonShapeMethod= new Rect({ width: 280, height: 280 });
  @State clipType: CommonShapeMethod= new Circle({ width: 280, height: 280 });
  @State shape_Type: CommonShapeMethod= new elliptical({ width: 200, height: 280 });
  @State lengthType: CommonShapeMethod= new line({ width: 0, height: 10 }); 
  @State pathType: CommonShapeMethod= new path({ width: 10, height: 10 });
  @State shape_2_Type: CommonShapeMethod= new polygon({ width: 5, height: 10 });
  @State shape_3_Type: CommonShapeMethod= new polyine({ width: 5, height: 10 });
  @State shape_4_Type: CommonShapeMethod= new rect_({ width: 5, height: 10 ,radius : 5});


  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.maskType = new Circle({ width: 280, height: 280 });
      }
    }
  }

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.shape_Type = new elliptical({ width: 200, height: 280 });
      }
    }
  }

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.lengthType = new line({ width: 200, height: 280 });
      }
    }
  }
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.shape_4_Type = new rect_({ width: 200, height: 280 });
      }
    }
  }
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.pathType = new path({ width: 200, height: 280 });
      }
    }
  }
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.shape_2_Type = new polygon({ width: 200, height: 280 });
      }
    }
  }
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if(eventData.data.maskValue != null) {
        this.shape_3_Type = new polyine({ width: 200, height: 280 });
      }
    }
  }

  private shapeChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("shapeClipping page shape change called:" + JSON.stringify(eventData));
      if(eventData.data.clipValue != null) {
        this.clipType = new Rect({ width: 280, height: 280 });
      }
    }
  }

  onPageShow() {
    console.info('shapeClipping page show called');
    var stateChangeEvent = {
      eventId: 32,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    var shapeChangeEvent = {
      eventId: 33,
      priority: events_emitter.EventPriority.LOW
      Environment
    }
    events_emitter.on(shapeChangeEvent, this.shapeChangCallBack);
  }

  build() {
    Column({ space: 5 }) {
      Text('clip')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)

      Image('/images/clip.png')
      .clip(this.clipType)
      .clip(this.shape_Type)
      .clip(this.lengthType)
      .clip(this.pathType)
      .clip(this.shape_2_Type)
      .clip(this.shape_3_Type)
      .clip(this.shape_4_Type)
      .width('500px')
      .height('280px')
      .key('image_clip')


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

      Image('/images/clip.png')
        .mask(this.maskType)
        .width('500px').height('280px')
        .key('image_mask')
    }

    .width('100%')
    .margin({ top: 5 })
  }
}