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
struct configCookieTest_callback {
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
            webview.WebCookieManager.configCookie(null, 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10038);
          }
        })

      Button('configCookie_url_undefined')
        .key('configCookie_url_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(undefined, 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10039);
          }
        })

      Button('configCookie_url_any')
        .key('configCookie_url_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(temp, 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10040);
          }
        })

      Button('configCookie_value_null')
        .key('configCookie_value_null')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, null, (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10041);
          }
        })


      Button('configCookie_value_undefined')
        .key('configCookie_value_undefined')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, undefined, (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10042);
          }
        })

      Button('configCookie_value_any')
        .key('configCookie_value_any')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, temp, (error) => {
              if (error) {
                console.log(error.code + error.message)
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(new ResultData(error.code, error.message), 10043);
          }
        })

      Button('configCookie_value_error')
        .key('configCookie_value_error')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie(URL, '', (error) => {
              if (error) {
                console.log(error.code + error.message)
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10044);
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
          }
        })

      Button('configCookie_url_error_1')
        .key('configCookie_url_error_1')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('X&X', 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10045);
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
          }
        })

      Button('configCookie_url_error_2')
        .key('configCookie_url_error_2')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('测试', 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10046);
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
          }
        })

      Button('configCookie_url_error_3')
        .key('configCookie_url_error_3')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookie('', 'a=b', (error) => {
              if (error) {
                console.log(error.code + error.message)
                Utils.emitEvent(new ResultData(String(error.code), error.message), 10047);
              }
            })
          } catch (error) {
            console.log(error.code + error.message)
          }
        })

      Web({ src: URL3, controller: this.controller })
    }
  }
}