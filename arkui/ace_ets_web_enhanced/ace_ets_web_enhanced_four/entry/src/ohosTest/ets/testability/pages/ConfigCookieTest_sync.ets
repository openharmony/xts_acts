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
struct configCookieTest_sync {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void{
    webview.WebCookieManager.clearAllCookiesSync()
  }

  build(){
    Column() {
      Button('configCookieSync_url_null')
        .key('configCookieSync_url_null')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(null, 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10100);
          }
        })


      Button('configCookieSync_url_undefined')
        .key('configCookieSync_url_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(undefined, 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10101);
          }
        })

      Button('configCookieSync_url_any')
        .key('configCookieSync_url_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(temp, 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10102);
          }
        })

      Button('configCookieSync_value_null')
        .key('configCookieSync_value_null')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, null)
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10103);
          }
        })

      Button('configCookieSync_value_undefined')
        .key('configCookieSync_value_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, undefined)
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10104);
          }
        })

      Button('configCookieSync_value_any')
        .key('configCookieSync_value_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, temp)
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10105);
          }
        })

      Button('configCookieSync_value_error')
        .key('configCookieSync_value_error')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, '')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10106);
          }
        })

      Button('configCookieSync_url_error_1')
        .key('configCookieSync_url_error_1')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync('X&X', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10107);
          }
        })

      Button('configCookieSync_url_error_2')
        .key('configCookieSync_url_error_2')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync('测试', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10108);
          }
        })

      Button('configCookieSync_url_error_3')
        .key('configCookieSync_url_error_3')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync('', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10109);
          }
        })

      Web({ src: URL3, controller: this.controller })
    }
  }
}