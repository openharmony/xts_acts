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

  build(){
    Column() {
      Button('saveHttpAuthCredentials_host_abnormal_1')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(null, this.realm, 'Stromgol', 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10017)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_host_null')

      Button('saveHttpAuthCredentials_host_abnormal_2')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(undefined, this.realm, 'Stromgol', 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10018)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_host_undefined')

      Button('saveHttpAuthCredentials_realm_abnormal_1')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, null, 'Stromgol', 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10019)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_realm_null')

      Button('saveHttpAuthCredentials_realm_abnormal_2')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, undefined, 'Stromgol', 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10020)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_realm_undefined')

      Button('saveHttpAuthCredentials_username_abnormal_1')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, null, 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10021)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_username_null')

      Button('saveHttpAuthCredentials_username_abnormal_2')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, undefined, 'Laroche');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10022)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_username_undefined')

      Button('saveHttpAuthCredentials_password_abnormal_1')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'Stromgol', null);
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10023)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_password_null')

      Button('saveHttpAuthCredentials_password_abnormal_2')
        .onClick(() => {
          try {
            webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'Stromgol', undefined);
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10024)
            console.error(`ErrorCode:` + error.code);
          }
        })
        .key('saveHttpAuthCredentials_password_undefined')

      Web({ src: this.header + this.body, controller: this.controller })
    }
  }
}