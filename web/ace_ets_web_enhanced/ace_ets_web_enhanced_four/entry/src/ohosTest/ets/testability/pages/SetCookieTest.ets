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
import { URL, URL3 } from './ConstConfig'

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
struct setCookieTest {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void{
    webview.WebCookieManager.clearAllCookiesSync()
  }

  build(){
    Column() {
      Button('setCookie_url_error_1')
        .key('setCookie_url_error_1')
        .onClick(() => {
          try {
            webview.WebCookieManager.setCookie('', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10110);
          }
        })

      Button('setCookie_url_error_2')
        .key('setCookie_url_error_2')
        .onClick(() => {
          try {
            webview.WebCookieManager.setCookie('X&X', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10111);
          }
        })

      Button('setCookie_url_error_3')
        .key('setCookie_url_error_3')
        .onClick(() => {
          try {
            webview.WebCookieManager.setCookie('测试', 'a=b')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10112);
          }
        })

      Button('setCookie_value_error')
        .key('setCookie_value_error')
        .onClick(() => {
          try {
            webview.WebCookieManager.setCookie(URL, '')
          } catch (error) {
            console.log('error:' + JSON.stringify(error));
            Utils.emitEvent(new ResultData(String(error.code), error.message), 10113);
          }
        })

      Web({ src: URL3, controller: this.controller })
    }
  }
}