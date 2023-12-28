/*
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

@Entry
@Component
struct webStorage {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State message: string = "123";
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebStorage click").key('WebStorageButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testGetOrigins001": {
              try {
                webView.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                  Utils.emitEvent(origins[0].origin, 20340)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20340)
              }
              break;
            }

            case "testGetOrigins002": {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].origin, 20341)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20341)
              }
              break;
            }

            case "testWebStorageOriginOrigin001": {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].origin, 20342)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20342)
              }
              break;
            }

            case "testWebStorageOriginUsage001": {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].usage, 20343)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20343)
              }
              break;
            }

            case "testWebStorageOriginQuota001": {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].quota > 0, 20344)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 20344)
              }
              break;
            }

            case "testDeleteAllData001": {
              try {
                webView.WebStorage.deleteAllData()
                await Utils.sleep(2000);
                webView.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.error('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 20345)
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                  Utils.emitEvent(origins[0].usage, 20345)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20345)
              }
              break;
            }


          }
        })
      }

      Web({ src: $rawfile('addOrigin.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .databaseAccess(this.databaseAccess)
    }
  }
}
