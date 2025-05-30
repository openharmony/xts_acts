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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebViewJavaScriptProxyAndOnPageVisible {
  @State str: string = ""
  @State zoomCounts: number = 200
  @State fontSize: number = 28
  controller: webView.WebviewController = new webView.WebviewController();

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

  build() {
    Column() {
      Row() {
        Button("web clicks").key('buttonJavaScriptProxyAndPageVisible').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitZoomCount": {
              this.zoomCounts = 200
              await Utils.sleep(2000)
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                let changeFontSize = this.fontSize * 2 + 'px'
                let changeResult = result.substring(1, result.length - 1)
                console.log("font-size :" + changeFontSize + "result :" + changeResult + error)
                if (changeResult == changeFontSize) {
                  Utils.emitEvent(true, 1403)
                }
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexThree.html"), controller: this.controller })
        .key("WebViewJavaScriptProxyAndOnPageVisibleWebView")
        .textZoomAtio(this.zoomCounts)
        .defaultFontSize(this.fontSize)
        .overviewModeAccess(false)
    }
  }
}
