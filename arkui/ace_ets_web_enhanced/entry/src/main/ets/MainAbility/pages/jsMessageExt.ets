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
import { JsProxyObject } from '../../test/Interfaces.d';
import business_error from '@ohos.base';

@Entry
@Component
struct jsMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];

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
        Button("JsMessageExt click").key('JsMessageExtButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testJsMessageExtGetType001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30200)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30200)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30200)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30200)
              }
              break;
            }

            case "testJsMessageExtGetType002": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30201)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30201)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30201)
              }
              break;
            }

            case "testJsMessageExtGetType003": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30202)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30202)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30202)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30202)
              }
              break;
            }

            case "testJsMessageExtGetType004": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        let e: business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30203)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30203)
              }
              break;
            }

            case "testJsMessageExtGetType005": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30204)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30204)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30204)
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
