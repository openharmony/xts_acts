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
import web_webview from '@ohos.web.webview';
import image from "@ohos.multimedia.image"
import business_error from '@ohos.base'


class testObj {
  constructor() {
  }

  test(str: string): ArrayBuffer {
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  controllerThree: web_webview.WebviewController = new web_webview.WebviewController();
  delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
  failedDownload: Uint8Array | null = null;
  @State str: string = "emitPostUrl";
  @State webId: number = 0;
  @State webId2: number = 0;
  @State webId3: number = 0;
  @State webIdTol: number = 0;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State userAgent2: string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " Chrome/86.0.4240.198 Safari/537.36";
  @State userAgentAll: string = "";
  @State userAgentCheck: string = "";
  @State userAgentPC:string = "";
  @State pageResult: boolean = false;
  @State pageResult2: boolean = false;
  @State indexUrl: string = "//rawfile/indexCopy.html";
  @State indexUrlTwo: string = "//rawfile/indexTwo.html";
  @State indexUrlAll: string = "//rawfile/indexCopy.html";
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  // @State checkEleResult: string | [] | number |  object = "";
  @State checkEleResult: number[] = [];

  @State checkEleResultAgain: string = "";
  @State checkEleResult1: string = "";
  @State checkEleResult2: string = "";
  @State checkEleResult3: string = "";
  @State cookieResult: string = "";
  @State testObjtest: testObj = new testObj();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  // private jsObj = {
  //   test: (res: object) => {
  //     Utils.emitEvent(res, 102);
  //   },
  //   toString: (str: string) => {
  //     console.info("ets toString:" + String(str));
  //   },
  //   register: (res: object) => {
  //     Utils.emitEvent(res, 86);
  //     return "web222"
  //   }
  // }

  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return "web222"
    }
  }




  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitPostUrl": {
              try {
                let postData = this.testObjtest.test("Name=test&Password=test");
                this.controller.postUrl('www.example.com', postData);
                let url = this.controller.getUrl();
                console.log("emitPostUrl: " + url);
                Utils.emitEvent(url, 150)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitgetUserAgent": {
              try {
                this.controller.loadUrl($rawfile('indexCopy.html'));
                this.userAgent = this.controller.getUserAgent();
                console.log("userAgent: " + this.userAgent);
                this.userAgent2 = this.controllerTwo.getUserAgent();
                console.log("userAgent2: " + this.userAgent2);
                this.userAgentAll = this.userAgent + this.userAgent2;
                console.log("userAgentAll: " + this.userAgentAll);
                if ((this.userAgentAll).includes("Mozilla")) {
                  this.userAgentAll = 'success'
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.userAgentAll, 1020)
              })
              break;
            }
            case "emitgetUserAgentAgain": {
              try {
                this.userAgentCheck = this.controllerThree.getUserAgent();
                console.log("userAgentCheck: " + this.userAgentCheck);
                this.controllerThree.runJavaScript("getUserAgent()", (error, result) => {
                  this.userAgentCheck = result
                  console.log(`The controllerThree.getUserAgent() return value is: ${result}`);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                if ((this.userAgentCheck).includes("Mozilla")) {
                  this.userAgentCheck = 'success'
                }
                Utils.emitEvent(this.userAgentCheck, 104)
              })
              break;
            }
            case "emitGetOriginalUrl": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                let indexUrl = this.controller.getOriginalUrl();
                console.log("original url: " + this.indexUrl);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.indexUrl, 118)
              })
              break;
            }
            case "emitGetOriginalUrlTwo": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                let indexUrl = this.controller.getOriginalUrl();
                console.log("original url: " + this.indexUrl);
                this.controllerTwo.loadUrl($rawfile('secondCopy.html'))
                let indexUrlTwo = this.controller.getOriginalUrl();
                console.log("original urlTwo: " + this.indexUrlTwo);
                this.indexUrlAll = this.indexUrl + this.indexUrlTwo;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.indexUrlAll, 120)
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .overScrollMode(OverScrollMode.NEVER)

      Web({ src: $rawfile('indexTwo.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent2)

      Web({ src: $rawfile('indexThree.html'), controller: this.controllerThree })
        .id('3')
        .key('web3')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgentAll)
        .userAgent(this.userAgent)
        .userAgent(this.userAgent2)
    }
  }
}