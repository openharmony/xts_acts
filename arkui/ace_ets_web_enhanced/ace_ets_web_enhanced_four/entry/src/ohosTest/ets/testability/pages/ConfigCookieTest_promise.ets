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
import { temp } from './temp'
import Utils from '../../test/Util'
import { URL, URL3 } from './ConstConfig'
import { BusinessError } from '@kit.BasicServicesKit';

class ResultData {
  public code: string;
  public message: string;

  constructor(code: string, message: string){
    this.code = code;
    this.message = message;
  }
}

@Entry
@Component
struct configCookieTest_promise {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void{
    webview.WebCookieManager.clearAllCookiesSync()
  }

  build(){
    Column() {
      Button('configCookie_url_null')
        .key('configCookie_url_null')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(null, 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10048);
          }
        })

      Button('configCookie_url_undefined')
        .key('configCookie_url_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(undefined, 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10049);
          }
        })

      Button('configCookie_url_any')
        .key('configCookie_url_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(temp, 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10050);
          }
        })

      Button('configCookie_value_null')
        .key('configCookie_value_null')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, null)
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10051);
          }
        })


      Button('configCookie_value_undefined')
        .key('configCookie_value_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, undefined)
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10052);
          }
        })

      Button('configCookie_value_any')
        .key('configCookie_value_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, temp)
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10053);
          }
        })

      Button('configCookie_value_error')
        .key('configCookie_value_error')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, '')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10054);
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
          }
        })

      Button('configCookie_url_error_1')
        .key('configCookie_url_error_1')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('X&X', 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10055);
              })
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
          }
        })

      Button('configCookie_url_error_2')
        .key('configCookie_url_error_2')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('测试', 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10056);
              })
          } catch (error) {

          }
        })

      Button('configCookie_url_error_3')
        .key('configCookie_url_error_3')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('', 'a=b')
              .then(() => {
                console.log('configCookie success!');
              })
              .catch((error: BusinessError) => {
                console.log('error: ' + JSON.stringify(error));
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10057);
              })
          } catch (error) {

          }
        })

      Web({ src: URL3, controller: this.controller })
    }
  }
}