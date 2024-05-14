/**
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

import testNapi from 'libentry.so';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct Index {
  mycontroller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
  @State interceptUrl: string = '';
  heads: Header[] = new Array();
  responseWeb: WebResourceResponse = new WebResourceResponse();
  webData: string = '{'

    + '}'

  build() {
    Row() {
      Column() {
        Button("goback").onClick( event => {
          this.mycontroller.backward();
        })

        Web({ src: $rawfile("chunked_post_stream.html"), controller: this.mycontroller})
          .javaScriptAccess(true)
          .width('100%')
          .height('100%')
          .databaseAccess(true)
          .fileAccess(true)
          .domStorageAccess(true)
          .cacheMode(CacheMode.Default)
          .onPageBegin( event => {
            testNapi.initResourceManager(getContext().resourceManager);
          }).onConsole((event) => {
          if (event) {

            console.log('onConsole getMessage:' + event.message?.getMessage())
            console.log('onConsole getSourceId:' + event.message?.getSourceId())
            console.log('onConsole getLineNumber:' + event.message?.getLineNumber())
            console.log('onConsole getMessageLevel:' + event.message?.getMessageLevel())
          }
          return false
        }).onErrorReceive((event) => {
            if (event) {
              console.log('onErrorReceive ==============> ')
              console.log('getErrorInfo:' + event.error.getErrorInfo())
              console.log('getErrorCode:' + event.error.getErrorCode())
              console.log('url:' + event.request.getRequestUrl())
              console.log('isMainFrame:' + event.request.isMainFrame())
              console.log('isRedirect:' + event.request.isRedirect())
              console.log('isRequestGesture:' + event.request.isRequestGesture())
              console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
              let result = event.request.getRequestHeader()
              console.log('The request header result size is ' + result.length)
              for (let i of result) {
                console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
              }
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
