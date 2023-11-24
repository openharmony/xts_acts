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
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
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
        Button("WebCookieManagerErrorCode click").key('WebCookieManagerErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetCookieError001": {
              try {
                let value = webView.WebCookieManager.getCookie('');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20070)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20070)
              }
              break;
            }

            case "testGetCookieError002": {
              try {
                let value = webView.WebCookieManager.getCookie(',https://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20071)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20071)
              }
              break;
            }

            case "testGetCookieError003": {
              try {
                let value = webView.WebCookieManager.getCookie('h,ttp://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20072)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20072)
              }
              break;
            }

            case "testGetCookieError004": {
              try {
                let value = webView.WebCookieManager.getCookie('123');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20073)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20073)
              }
              break;
            }

            case "testSetCookieError001": {
              try {
                webView.WebCookieManager.setCookie('', 'a=b');
                Utils.emitEvent(this.no_error, 20080)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20080)
              }
              break;
            }

            case "testSetCookieError002": {
              try {
                webView.WebCookieManager.setCookie(',http://www.example.com', 'a=b');
                Utils.emitEvent(this.no_error, 20081)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20081)
              }
              break;
            }

            case "testSetCookieError003": {
              try {
                webView.WebCookieManager.setCookie('123', 'a=b');
                Utils.emitEvent(this.no_error, 20082)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20082)
              }
              break;
            }

            case "testSetCookieError004": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', '');
                Utils.emitEvent(this.no_error, 20083)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20083)
              }
              break;
            }

            case "testSetCookieError005": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', ' ');
                Utils.emitEvent(this.no_error, 20084)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20084)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
