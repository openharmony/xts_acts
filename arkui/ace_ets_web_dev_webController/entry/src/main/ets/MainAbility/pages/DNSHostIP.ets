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
import web_webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct DNSHostIP {
  @State userAgentPC:string = "";
  @State str: string = "";
  @State getURL: string = "";
  @State getURL1: string = "";
  @State getURL2: string = "";
  @State getURL3: string = "";
  @State getURL4: string = "";
  @State value: boolean = false;
  @State isMetaViewport: boolean | null | undefined = false;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

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
        Button("DNSHostIP").id('DNSHostIP').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "setHostIP0100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8770)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8770)
                  break;
                }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('www.example.com', '124.95.179.4', 30);
                await Utils.sleep(1000);
                this.controller.loadUrl('www.example.com')
                this.getURL = this.controller.getUrl();
                console.log('setHostIP0100_getUrl1: ' + this.getURL)
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('www.example.com');
                await Utils.sleep(1000);
                this.controller.removeCache(true);
                await Utils.sleep(5000);
                this.controller.refresh();
                this.controller.loadUrl('www.example.com')
                await Utils.sleep(1000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP0100_getUrl2: ' + this.getURL1)
                if (this.getURL == this.getURL1) {
                  this.value = true
                }
                console.log('setHostIP0100_value: ' + this.value)

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8770)
              }, 3000)
              break;
            }
            case "setHostIP0800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8772)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8772)
                  break;
                }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('www.example.com', '124.95.179.4', 30);
                await Utils.sleep(1000);
                this.controller.loadUrl('www.example.com')
                this.getURL = this.controller.getUrl();
                console.log('setHostIP0800_getUrl1' + this.getURL)
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('www.example.com');
                await Utils.sleep(1000);
                this.controller.removeCache(true);
                await Utils.sleep(5000);
                this.controller.loadUrl('www.example.com')
                await Utils.sleep(1000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP0800_getUrl2' + this.getURL1)
                if (this.getURL == this.getURL1) {
                  this.value = true
                }
                console.log('setHostIP0800_value' + this.value)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8772)
              }, 3000)
              break;
            }
          }
        })
      }
      Web({ src: 'https://www.example.com', controller: this.controller })
        .height(500)
        .width(500)
    }
  }
}
