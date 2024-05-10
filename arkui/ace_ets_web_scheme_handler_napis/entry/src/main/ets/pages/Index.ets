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

import hilog from '@ohos.hilog';
import testNapi from 'libentry.so'
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
  aboutToAppear(): void {
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
              this.controller.refresh();
              console.log("testNapi getUrl => " + testNapi.getUrl())
          })
          
        Web({ src:$rawfile('index.html'), controller: this.controller })
            .height('50%')
            .width('100%')
            .javaScriptAccess(true)
            .fileAccess(true)
            .onPageBegin(
                event => {
                    // 初始化管理文件
                    testNapi.initResourceManager(getContext().resourceManager);
                }
             )
      }
      .width('100%')
    }
    .height('100%')
  }
}
