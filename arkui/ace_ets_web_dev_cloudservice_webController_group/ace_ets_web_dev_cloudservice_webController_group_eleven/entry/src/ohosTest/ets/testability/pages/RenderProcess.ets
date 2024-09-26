/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*  http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController()

  aboutToAppear(): void{
    try {
      let features = new webview.BackForwardCacheSupportedFeatures();
      features.nativeEmbed = true;
      features.mediaTakeOver = true;
      // 如果一个页面同时使用了同层渲染和视频托管的能力，需要 nativeEmbed
      // mediaTakeOver 同时设置为 true，该页面才可以进入前进后退缓存中。
      webview.WebviewController.enableBackForwardCache(features);
      webview.WebviewController.initializeWebEngine();
    } catch (e) {
    }
  }

  build(){
    Column() {

      Button('返回').onClick((event: ClickEvent) => {
        router.back()
      }).id('back')
      Web({ src: 'www.baidu.com', controller: this.controller })
        .onRenderProcessNotResponding((data) => {
          console.log('onRenderProcessNotResponding: [jsStack]= ' + data.jsStack +
            ', [process]=' + data.pid + ', [reason]=' + data.reason);
        })
    }.width('100%')
    .height('100%')
  }
}
