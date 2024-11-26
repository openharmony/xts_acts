/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Util';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct webFour {
  @State str: string = ''
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State src: string | Resource = 'https:' + '//www.baidu.com'
  urlTrustList: string =
    '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"trust.example.com\", \"port\":80, \"path\":\"test\"}]}'
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  aboutToAppear(): void{
    webview.WebCookieManager.clearAllCookiesSync()
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {
      Button('webTestFour')
        .key('webTestFour')
        .onClick(() => {
          switch (this.str) {
            case 'testErrorCodeMessage7700':
              try {
                webview.WebCookieManager.fetchCookie(null)
                  .then((value) => {
                    console.log('fetchCookieSync cookie = ' + JSON.stringify(value));
                    Utils.emitEvent(JSON.stringify(value), 350)
                  })
                  .catch((e: BusinessError) => {
                    console.log('fetchCookieSync cookie1111 = ' + e.code + e.message);
                    Utils.emitEvent(e.code + e.message, 350)
                  })
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 350)
              }
              break;
            case 'testErrorCodeMessage7800':
              try {
                let value = webview.WebCookieManager.fetchCookieSync('http:' +
                  '//www.ghdgdhgeig.com')
                console.info('fetchCookieSync value' + value);
                Utils.emitEvent('true', 351)
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 351)
              }
              break;
            case 'testErrorCodeMessage7900':
              try {
                let options = new webview.BackForwardCacheOptions();
                options.size = 3;
                options.timeToLive = 10;
                this.controller1.setBackForwardCacheOptions(options);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 352)
              }
              break;
            case 'testErrorCodeMessage8000':
              try {
                this.controller1.setPathAllowingUniversalAccess([
                  getContext().resourceDir,
                  getContext().filesDir + '/example'
                ])
                this.controller1.loadUrl('file://' + getContext().resourceDir + '/index.html')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 353)
              }
              break;
            case 'testErrorCodeMessage8100':
              try {
                this.controller1.setUrlTrustList(this.urlTrustList);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 354)
              }
              break;
            case 'testErrorCodeMessage8200':
              try {
                webview.WebviewController.clearHostIP(null);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 355)
              }
              break;
            case 'testErrorCodeMessage8300':
              try {
                webview.WebviewController.setHostIP(null, '127.0.0.1', 30);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 356)
              }
              break;
            case 'testErrorCodeMessage8400':
              try {
                webview.WebviewController.setHostIP(undefined, '127.0.0.1', 30);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 357)
              }
              break;
            case 'testErrorCodeMessage8500':
              try {
                webview.WebviewController.setHostIP('www.example.com', null, 30);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 358)
              }
              break;
            case 'testErrorCodeMessage8600':
              try {
                webview.WebviewController.setHostIP('www.example.com', undefined, 30);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 359)
              }
              break;
            case 'testErrorCodeMessage8700':
              try {
                webview.WebviewController.setHostIP('www.example.com', '127.0.0.1', null);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 360)
              }
              break;
            case 'testErrorCodeMessage8800':
              try {
                webview.WebviewController.setHostIP('www.example.com', '127.0.0.1', undefined);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 361)
              }
              break;
            case 'testErrorCodeMessage8900':
              try {
                webview.WebviewController.setHostIP('www.example.com', '127.0.0.1', -1);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 362)
              }
              break;
            case 'testErrorCodeMessage9000':
              try {
                this.controller1.closeCamera();
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 363)
              }
              break;
            case 'testErrorCodeMessage9100':
              try {
                this.controller1.stopCamera();
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 364)
              }
              break;
            case 'testErrorCodeMessage9200':
              try {
                this.controller1.startCamera();
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 365)
              }
              break;
            case 'testErrorCodeMessage9300':
              try {
                webview.WebviewController.setServiceWorkerWebSchemeHandler(null, this.schemeHandler);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 366)
              }
              break;
            case 'testErrorCodeMessage9400':
              try {
                webview.WebviewController.setServiceWorkerWebSchemeHandler(undefined, this.schemeHandler);
                console.log(' setHostIP success')
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 367)
              }
              break;
            case 'testErrorCodeMessage9500':
              try {
                webview.WebviewController.setServiceWorkerWebSchemeHandler('http', null);
                console.log(' setHostIP success handler=null')
                Utils.emitEvent(true, 368)
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 368)
              }
              break;
            case 'testErrorCodeMessage9600':
              try {
                webview.WebviewController.setServiceWorkerWebSchemeHandler('http', undefined);
                console.log(' setHostIP success handler=undefined')
                Utils.emitEvent(true, 369)
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 369)
              }
              break;
            case 'testErrorCodeMessage9700':
              try {
                this.controller1.clearWebSchemeHandler();
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 370)
              }
              break;
            case 'testErrorCodeMessage9800':
              try {
                this.controller.setWebSchemeHandler(null, this.schemeHandler);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 371)
              }
              break;
            case 'testErrorCodeMessage9900':
              try {
                this.controller.setWebSchemeHandler(undefined, this.schemeHandler);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 372)
              }
              break;
            case 'testErrorCodeMessage10000':
              try {
                this.controller.setWebSchemeHandler('http', null);
                Utils.emitEvent(true, 373)
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 373)
              }
              break;
            case 'testErrorCodeMessage10100':
              try {
                this.controller.setWebSchemeHandler('http', undefined);
                Utils.emitEvent(true, 374)
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 374)
              }
              break;
            case 'testErrorCodeMessage10200':
              try {
                this.controller1.setWebSchemeHandler('http', this.schemeHandler);
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 375)
              }
              break;
            case 'testErrorCodeMessage10300':
              try {
                this.controller1.getMediaPlaybackState()
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 376)
              }
              break;
            case 'testErrorCodeMessage10400':
              try {
                this.controller1.closeAllMediaPresentations()
              } catch (e) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
                Utils.emitEvent(e.code + e.message, 377)
              }
              break;
          }
        })

      Web({ src: this.src, controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)

    }
    .height('100%')
    .width('100%')
  }
}