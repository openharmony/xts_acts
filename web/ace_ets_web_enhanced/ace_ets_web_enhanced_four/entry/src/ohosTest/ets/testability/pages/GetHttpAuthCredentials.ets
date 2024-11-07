/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Util';

@Entry
@Component
struct WebComponent {
  private header: string = 'www.'
  private body: string = 'example.com'
  controller: webview.WebviewController = new webview.WebviewController();
  host: string = 'www.spincast.org';
  realm: string = 'protected example';
  usernamePassword: string[] = [];

  build(){
    Column() {
      Button('getHttpAuthCredentials_host_null')
        .onClick(() => {
          try {
            this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(null, this.realm);
            console.log('num: ' + this.usernamePassword.length);
          } catch (error) {
            console.error(`ErrorCode:` + error.code);
            Utils.emitEvent(error.code + error.message, 10001)
          }
        })
        .key('getHttpAuthCredentials_host_null')

      Button('getHttpAuthCredentials_realm_null')
        .onClick(() => {
          try {
            this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, null);
            console.log('num: ' + this.usernamePassword.length);
          } catch (error) {
            console.error(`ErrorCode:` + error.code);
            Utils.emitEvent(error.code + error.message, 10002)
          }
        })
        .key('getHttpAuthCredentials_realm_null')
      Web({ src: this.header + this.body, controller: this.controller })
    }
  }
}