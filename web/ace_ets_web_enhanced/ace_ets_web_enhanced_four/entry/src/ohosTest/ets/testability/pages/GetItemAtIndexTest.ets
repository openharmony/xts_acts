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
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { temp, temps } from '../../test/Const';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State icon: image.PixelMap | undefined = undefined;

  build(){
    Column() {
      Button('getBackForwardEntries')
        .key('008')
        .onClick(() => {
          try {
            let list = this.controller.getBackForwardEntries();
            let historyItem = list.getItemAtIndex(-1);
            console.log('HistoryItem: ' + JSON.stringify(historyItem));
            this.icon = historyItem.icon;
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).message}`);
            LocalContext.context.eventHub.emit('GetItemAtIndexTest-error', error.code, error.message)
          }
        })

      Button('getBackForwardEntries')
        .key('0081')
        .onClick(() => {
          try {
            let list = this.controller.getBackForwardEntries();
            let historyItem = list.getItemAtIndex(temps);
            console.log('HistoryItem: ' + JSON.stringify(historyItem));
            this.icon = historyItem.icon;
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).message}`);
            LocalContext.context.eventHub.emit('GetItemAtIndexTest1-error', error.code, error.message)
          }
        })

      Button('getBackForwardEntries')
        .key('0082')
        .onClick(() => {
          try {
            let list = this.controller.getBackForwardEntries();
            let historyItem = list.getItemAtIndex(8);
            console.log('HistoryItem: ' + JSON.stringify(historyItem));
            this.icon = historyItem.icon;
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).message}`);
            LocalContext.context.eventHub.emit('GetItemAtIndexTest2-error', error.code, error.message)
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}