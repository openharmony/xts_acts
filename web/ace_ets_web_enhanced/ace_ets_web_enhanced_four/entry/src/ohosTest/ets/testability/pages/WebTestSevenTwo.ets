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

import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Util';
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { http } from '@kit.NetworkKit';


interface GeneratedObjectLiteralInterface_1 {
  key1: string;
}

@Entry
@Component
struct WebComponent {
  @State str: string = '';
  @State url: string = ''
  @State url1: string = ''
  @State widths: number = 100
  @State heights: number = 100
  @State isVisible: boolean = false
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State visible: Visibility = Visibility.Visible
  @State show: boolean = true
  @State flag: boolean = false
  @State flag1: boolean = false
  urltrustList: string = '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'port\':80, \'path\':\'test\'}]}'
  urltrustList1: string =
    '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'host\':\'www.example.com\', \'path\':\'test\'}]}'
  urltrustList2: string = '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'host\':\'www.example.com\', \'port\':80 }]}'
  urltrustList3: string = '{\'UrlPermissionList\':[{ \'host\':\'www.example.com\', \'port\':80, \'path\':\'test\'}]}'
  urltrustList4: string =
    '{\'UrlPermissionList\':[{\'scheme\':\'http\', \'host\':\'www.example.com\', \'port\':80, \'path\':\'test\'}]}'
  urltrustList5: string =
    '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'host\':\'www.example.com\', \'port\':80, \'path\':\'test\'}]}'
  urltrustList6: string =
    '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'host\':\'www.baidu.com\', \'port\':80, \'path\':\'*\'}]}'
  urltrustList7: string =
    '{\'UrlPermissionList\':[{\'scheme\':\'https\', \'host\':\'www.baidu.com\', \'port\':80, \'path\':\'*\'}]}'

  postRequest(){
    let httpRequest = http.createHttp();
    let url = 'https:' +
      '//www.baidu.com:81'; // 请替换为实际的URL
    let postData: GeneratedObjectLiteralInterface_1 = { key1: 'value1' }; // 要发送的数据

    let promise = httpRequest.request(url, {
      method: http.RequestMethod.POST,
      header: { 'contentType': 'application/json; charset=utf-8' },
      extraData: JSON.stringify(postData) // 将对象转换为JSON字符串
    });

    promise.then((data) => {
      if (data.responseCode === http.ResponseCode.OK) {
        console.info('Result:' + data.result);
      } else {
        console.error('Request failed with response code:' + data.responseCode);
      }
    }).catch((err: BusinessError) => {
      console.error('Error:' + JSON.stringify(err));
    });
  }

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  aboutToDisappear(): void{
    switch (this.str) {
    }
  }

  build(){
    Column() {
      Button('Setting the trustlist')
        .key('trust')
        .onClick(() => {
          switch (this.str) {
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0100':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0200':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList1);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0300':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList2);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0400':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList3);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0500':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList4);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0600':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList5);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0700':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList6);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0800':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller.setUrlTrustList(this.urltrustList6);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0900':
              try {
                // 设置白名单，只允许访问trust网页
                this.controller1.setUrlTrustList(this.urltrustList7);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('button')
        .key('vis')
        .onClick(async () => {
          switch (this.str) {
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400':
              this.visible = Visibility.Hidden
              break;
            case 'SUB_WEB_TESTABOUTTODISAPPERTEST_0400':
              router.pushUrl({
                url: 'testability/pages/webTestSevenTwo'
              })
              break;
          }
        })

      Button('button')
        .key('ref')
        .onClick(async () => {
          switch (this.str) {
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100':
              this.widths = 0
              this.heights = 0
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200':
              this.widths = 200
              this.heights = 200
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300':
              this.widths = 200
              this.heights = 200
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400':
              this.widths = 200
              this.heights = 200
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTABOUTTODISAPPERTEST_0400':
              this.widths = 200
              this.heights = 200
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0100':
              this.controller.loadUrl('http:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0200':
              this.controller.loadUrl('http:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0300':
              this.controller.loadUrl('http:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0400':
              this.controller.loadUrl('http:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0500':
              this.controller.loadUrl('https:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0600':
              this.controller.loadUrl('http:' +
                '//www.example.com/test')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0700':
              this.controller.loadUrl('http:' +
                '//www.baidu.com')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0800':
              this.controller.loadUrl('http:' +
                '//www.baidu.com:81')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0900':
              this.controller1.loadUrl('http:' +
                '//www.baidu.com')
              this.controller.refresh()
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_1000':
              this.controller1.loadUrl('http:' +
                '//www.baidu.com')
              this.controller.refresh()
              break;
          }
        })

      Button('button')
        .key('open11')
        .onClick(async () => {
          switch (this.str) {
            case 'SUB_WEB_TESTONPAGEBEGINTEST_0100':
              Utils.emitEvent(this.url, 503);
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100':
              Utils.emitEvent(this.isVisible, 504);
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200':
              Utils.emitEvent(this.isVisible, 505);
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300':
              Utils.emitEvent(this.isVisible, 506);
              break;
            case 'SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400':
              Utils.emitEvent(this.isVisible, 507);
              break;
            case 'SUB_WEB_TESTABOUTTODISAPPERTEST_0400':
              Utils.emitEvent(false, 508);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0100':
              Utils.emitEvent(this.flag, 511);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0100':
              Utils.emitEvent(this.url1, 512);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0200':
              Utils.emitEvent(this.url1, 513);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0300':
              Utils.emitEvent(this.url1, 514);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0400':
              Utils.emitEvent(this.url1, 515);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0500':
              Utils.emitEvent(this.url1, 516);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0600':
              Utils.emitEvent(this.url1, 517);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0400':
              Utils.emitEvent(false, 518);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0700':
              Utils.emitEvent(this.flag, 520);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0800':
              Utils.emitEvent(this.flag, 521);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_0900':
              Utils.emitEvent(this.flag1, 522);
              break;
            case 'SUB_WEB_TESTSETURLTRUSTLISTTEST_1000':
              Utils.emitEvent(this.flag, 523);
              break;
          }
        })

      if (this.show) {
        Web({ src: '', controller: this.controller })
          .visibility(this.visible)
          .onPageVisible((event) => {
            console.log('onPageVisible url:' + event.url);
            this.url = event.url
          })
          .onControllerAttached(() => {
            this.controller.loadUrl('www.baidu.com')
          })
          .onErrorReceive((event) => {
            if (event) {
              console.log('getErrorInfo:' + event.error.getErrorInfo());
              console.log('getErrorCode:' + event.error.getErrorCode());
              console.log('onErrorReceiveurl:' + event.request.getRequestUrl());
              console.log('isMainFrame:' + event.request.isMainFrame());
              console.log('isRedirect:' + event.request.isRedirect());
              console.log('isRequestGesture:' + event.request.isRequestGesture());
              console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString());
              let result = event.request.getRequestHeader();
              console.log('The request header result size is ' + result.length);
              for (let i of result) {
                console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue);
              }
            }
          })
          .onLoadIntercept((event) => {
            if (event) {
              console.log('onLoadIntercepturl:' + event.data.getRequestUrl());
              this.url1 = event.data.getRequestUrl()
              console.log('isMainFrame:' + event.data.isMainFrame());
              console.log('isRedirect:' + event.data.isRedirect());
              console.log('isRequestGesture:' + event.data.isRequestGesture());
            }
            return true;
          })
          .onLoadIntercept((event) => {
            if (event) {
              console.log('onLoadIntercepturl:' + event.data.getRequestUrl());
              this.url1 = event.data.getRequestUrl()
              console.log('isMainFrame:' + event.data.isMainFrame());
              console.log('isRedirect:' + event.data.isRedirect());
              console.log('isRequestGesture:' + event.data.isRequestGesture());
              this.flag = true
            }
            return false;
          })
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            console.info('Test Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
            this.isVisible = isVisible
            if (isVisible && currentRatio >= 1.0) {
              console.info('Test Text is fully visible. currentRatio:' + currentRatio)
            }
            if (!isVisible && currentRatio <= 0.0) {
              console.info('Test Text is completely invisible.')
            }
          })
          .width(this.widths)
          .height(this.heights)
      } else {
        Text('隐藏')
      }


      Web({ src: '', controller: this.controller1 })
        .onControllerAttached(() => {
          this.controller.loadUrl('www.baidu.com')
        })
        .onLoadIntercept((event) => {
          if (event) {
            console.log('onLoadIntercepturl:' + event.data.getRequestUrl());
            this.url1 = event.data.getRequestUrl()
            console.log('isMainFrame:' + event.data.isMainFrame());
            console.log('isRedirect:' + event.data.isRedirect());
            console.log('isRequestGesture:' + event.data.isRequestGesture());
          }
          this.flag1 = true
          return false;
        })
        .width(500)
        .height(200)

    }
  }
}