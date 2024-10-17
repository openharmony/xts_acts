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
import { BusinessError } from '@kit.BasicServicesKit';
import { http } from '@kit.NetworkKit';

interface GeneratedObjectLiteralInterface_1 {
  key1: string;
}

interface GeneratedObjectLiteralInterface_2 {
  key1: string;
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State url: string = ''
  @State src: string = 'resource://rawfile/index.html';
  @State flag: number = 0
  @State flag1: boolean = false

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
  diaglogController: CustomDialogController = new CustomDialogController({
    builder: CustomActionSheet({}),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  postRequest(){
    let httpRequest = http.createHttp();
    let url = 'https://www.example.com/post'; // 请替换为实际的URL
    let postData: GeneratedObjectLiteralInterface_1 = { key1: 'value1' }; // 要发送的数据

    let promise = httpRequest.request(url, {
      method: http.RequestMethod.POST,
      header: { 'Content-Type': 'application/json; charset=utf-8' },
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

  getRequest(){
    let httpRequest = http.createHttp();
    let baseUrl = 'https://www.example.com/get'; // 请替换为实际的URL
    let queryParams: GeneratedObjectLiteralInterface_2 = { key1: 'value1' }; // 查询参数

    // 将查询参数转换为URL查询字符串
    let queryString = Object.keys(queryParams)
      .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(queryParams.key1)}`)
      .join('&');

    let url = `${baseUrl}?${queryString}`;

    let promise = httpRequest.request(url, {
      method: http.RequestMethod.GET,
      header: { 'Content-Type': 'application/json; charset=utf-8' }
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

  build(){
    Column() {
      Button('refresh')
        .key('refresh')
        .onClick(async () => {
          switch (this.str) {
            case 'SUB_WEB_TESTONPAGEBEGINTEST_0300':
              this.controller.refresh()
              break;
          }
        })

      Button('button')
        .key('open')
        .onClick(async () => {
          switch (this.str) {
            case 'SUB_WEB_TESTONPAGEVISIBLETEST_0100':
              this.diaglogController.open()
              break;
            case 'SUB_WEB_TESTONPAGEVISIBLETEST_0200':
              Utils.emitEvent(this.url, 501);
              break;
            case 'SUB_WEB_TESTONPAGEBEGINTEST_0200':
              Utils.emitEvent(this.flag, 509);
              break;
            case 'SUB_WEB_TESTONPAGEBEGINTEST_0300':
              Utils.emitEvent(this.flag, 510);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0200':
              Utils.emitEvent(this.flag1, 512);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0300':
              this.postRequest()
              Utils.emitEvent(this.flag1, 513);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0400':
              this.getRequest()
              Utils.emitEvent(this.flag1, 514);
              break;
            case 'SUB_WEB_TESTONLOADINTERCEPTTEST_0500':
              Utils.emitEvent(true, 519);
              break;
          }
        })

      Column() {
        Web({ src: this.src, controller: this.controller })
          .onPageVisible((event) => {
            console.log('onPageVisible url:' + event.url);
            this.url = event.url
          })
          .onPageBegin((event) => {
            if (event) {
              console.log('-------')
              this.flag += 1
            }
          })
          .onLoadIntercept((event) => {
            if (event) {
              console.log('url:' + event.data.getRequestUrl());
              console.log('isMainFrame:' + event.data.isMainFrame());
              console.log('isRedirect:' + event.data.isRedirect());
              console.log('isRequestGesture:' + event.data.isRequestGesture());
              this.flag1 = false
            }
            return false;
          })
      }
    }
  }
}


@CustomDialog
export default struct CustomActionSheet {
  controller: CustomDialogController

  build(){
    Column() {
      Button('取消', { type: ButtonType.Normal })
        .key('close')
        .borderRadius(4)
        .width(80)
        .onClick((e) => {
          this.controller.close()
          Utils.emitEvent(true, 500);
        })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.Center)
    .height(200)
    .padding({ left: 10, top: 20 })
    .borderRadius(8)
  }
}