/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';


@Entry
@Component
struct WebComponent {
  @State str: string = "NestedScrollMode01";
  private scrollerForswiper:SwiperController= new SwiperController()
  private scrollerForswiper2:SwiperController= new SwiperController()
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller2: web_webview.WebviewController = new web_webview.WebviewController();
  @State NestedScrollModeUp:NestedScrollMode=NestedScrollMode.SELF_FIRST
  @State NestedScrollModeDown:NestedScrollMode=NestedScrollMode.SELF_FIRST
  @State NestedScrollModeRight:NestedScrollMode=NestedScrollMode.SELF_FIRST
  @State NestedScrollModeLeft:NestedScrollMode=NestedScrollMode.SELF_FIRST
  // scroll横向的滚动
  @State ScrollDirection:ScrollDirection=ScrollDirection.Horizontal
  @State offsetX:number = 0
  @State offsetY:number = 0
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page NestedScrollMode01");
    if (eventData != null) {
      console.info("NestedScrollMode01:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  aboutToAppear():void {
      web_webview.WebviewController.setWebDebuggingAccess(true);
  }
  build() {
    Column() {

      Row() {
        Button("web test").key('NestedScrollModeTest').onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('NestedScrollModeWeb');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {
            case "NestedScrollMode01": {
              let driver: Driver = await Driver.create()
              this.offsetX = 0
              await driver.swipe(X, Y, X-100, Y);
              await Utils.sleep(2000);
              if(this.offsetX >0) {
                Utils.emitEvent(true, 20241129)
              }
              break;
            }
            case "NestedScrollMode02": {
              let driver: Driver = await Driver.create()
              this.offsetX = 0
              await driver.swipe(X, Y, X+100, Y);
              await Utils.sleep(2000);
              if(this.offsetX < 100) {
                Utils.emitEvent(true, 20241130)
              }
              break;
            }

            case "NestedScrollMode03": {
              let driver: Driver = await Driver.create()
              this.offsetY = 0
              await driver.swipe(X, Y, X, Y-100);
              await Utils.sleep(2000);
              if(this.offsetY >0) {
                Utils.emitEvent(true, 20241131)
              }
              break;
            }

            case "NestedScrollMode04": {
              let driver: Driver = await Driver.create()
              this.offsetY = 0
              await driver.swipe(X, Y, X, Y+100);
              await Utils.sleep(2000);
              if(this.offsetY < 100) {
                Utils.emitEvent(true, 20241132)
              }
              break;
            }
          }
        })
      }

      Swiper(this.scrollerForswiper) {
        Swiper(this.scrollerForswiper2) {
          Web({ src: $rawfile('nestedScroll.html'), controller: this.controller })
            .cacheMode(CacheMode.Online)
            .onlineImageAccess(true)
            .domStorageAccess(true)
            .imageAccess(true)
            .overviewModeAccess(true)
            .zoomAccess(true)
            .geolocationAccess(true)
            .javaScriptAccess(true)
            .databaseAccess(true)
            .mixedMode(MixedMode.All)
            .height("90%")
            .key('NestedScrollModeWeb')
            .nestedScroll({
              scrollUp: this.NestedScrollModeUp,
              scrollDown: this.NestedScrollModeDown,
              scrollRight: this.NestedScrollModeRight,
              scrollLeft: this.NestedScrollModeLeft,
            })
            .onScroll((event) => {
              this.offsetX = event.xOffset;
              this.offsetY = event.yOffset;
              console.info("x = " + event.xOffset);
              console.info("y = " + event.yOffset);
            })
            .width("50%")
            .border({ width: 5, color: '#ef3e53' })
        }
        .width('100%').height('70%')
        .vertical(false)
      }.width('90%').height('70%')
      .vertical(true)

    }
  }
}