/*
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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'
import image from "@ohos.multimedia.image";
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getSurfaceId {
  @State str: string = "emitGetSurfaceId0100";
  @State checkResult: number = 0;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State imagePixelMap: image.PixelMap | undefined = undefined;
  urltrustList: string = "{\"UrlPermissionList\":[{\"host\":\"www.example.com\"}]}"


  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("getSurfaceId").key('getSurfaceIdButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetSurfaceId0100": {
              try {
                let surfaceId = this.controller.getSurfaceId();
                console.log("surfaceId: " + surfaceId);
                if(surfaceId.length != 0) {
                  let region:image.Region = { x: 0, y: 0, size: { height: 800, width: 1000}}
                  this.imagePixelMap = image.createPixelMapFromSurfaceSync(surfaceId, region) 
                  Utils.emitEvent(true, 28930)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "emitSetUrlTrustList0100": {
              try {
                this.controller.clearMatches();
                this.controller.loadUrl('www.example.com');
                await Utils.sleep(2000);
                this.checkResult = 1;
                this.controller.setUrlTrustList(this.urltrustList);
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.baidu.com');
                await Utils.sleep(5000);
                this.controller.searchAllAsync('返回');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "emitSetUrlTrustList0200": {
              try {
                this.controller.clearMatches();
                this.controller.loadUrl('www.example.com');
                await Utils.sleep(2000);
                this.controller.setUrlTrustList('');
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.baidu.com');
                await Utils.sleep(2000);
                this.checkResult = 2;
                await Utils.sleep(2000);
                this.controller.searchAllAsync('百度一下');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
        Image(this.imagePixelMap)
        .height(100)
      }

      Web({src: 'www.example.com', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER})
      .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            if(this.checkResult == 1) {
              console.log('checkone')
              Utils.emitEvent(ret.numberOfMatches, 28931)
              this.checkResult = 0;
            }
            if(this.checkResult == 2) {
              console.log('checktwo')
              Utils.emitEvent(ret.numberOfMatches, 28932)
              this.checkResult = 0;
            }
          }
        })
    }
  }
}