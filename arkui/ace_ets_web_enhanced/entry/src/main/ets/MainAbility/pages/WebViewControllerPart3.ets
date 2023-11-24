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

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true

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
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testAccessForward001": {
              try {
                Utils.emitEvent(this.controller.accessForward(), 50520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 50522)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward001": {
              try {
                Utils.emitEvent(this.controller.accessBackward(), 50526)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 50528)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep001": {
              try {
                Utils.emitEvent(this.controller.accessStep(1), 50530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 50532)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep003": {
              try {
                Utils.emitEvent(this.controller.accessStep(-1), 50534)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep004": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 50536)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}
