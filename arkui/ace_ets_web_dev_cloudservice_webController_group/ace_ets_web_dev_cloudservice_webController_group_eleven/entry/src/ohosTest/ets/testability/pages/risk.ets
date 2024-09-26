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
import { router } from '@kit.ArkUI';
import { url3 } from './Const';


@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Column() {
        Button('返回').onClick((event: ClickEvent) => {
          router.back()
        }).id('back')
      }

      Column() {
        Web({ src: url3, controller: this.controller })
          .enableNativeEmbedMode(true)
          .onSafeBrowsingCheckResult((callback) => {
            let jsonData = JSON.stringify(callback)
            console.log('jsonData' + jsonData)
            let json: OnSafeBrowsingCheckResultCallback = JSON.parse(jsonData)
          })
      }.height('50%')
    }.height('100%')
  }
}
