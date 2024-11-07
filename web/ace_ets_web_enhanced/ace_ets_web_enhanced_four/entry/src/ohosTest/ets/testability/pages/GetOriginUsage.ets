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
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  private origin: string | null = 'resource://rawfile/'

  build(){
    Column() {
      Button('callback_origin_error_1')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage('X&X', (error, usage) => {
              if (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10009)
                return;
              }
              console.log('usage: ' + usage);
            })
          } catch (error) {
            console.error(error.code + error.message);
          }
        })
        .key('callback_origin_error_1')

      Button('callback_origin_error_2')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage('测试', (error, usage) => {
              if (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10010)
                return;
              }
              console.log('usage: ' + usage);
            })
          } catch (error) {
            console.error(error.code + error.message);
          }
        })
        .key('callback_origin_error_2')

      Button('callback_origin_null')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage(null, (error, usage) => {
              if (error) {
                console.error(error.code + error.message);
                return;
              }
              console.log('usage: ' + usage);
            })
          } catch (error) {
            console.error(error.code + error.message);
            Utils.emitEvent(error.code + error.message, 10011)
          }
        })
        .key('callback_origin_null')

      Button('callback_origin_undefined')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage(undefined, (error, usage) => {
              if (error) {
                console.error(error.code + error.message);
                return;
              }
              console.log('usage: ' + usage);
            })
          } catch (error) {
            console.error(error.code + error.message);
            Utils.emitEvent(error.code + error.message, 10012)
          }
        })
        .key('callback_origin_undefined')

      Button('promise_origin_error_1')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage('X&X')
              .then(quota => {
                console.log('quota: ' + quota);
              })
              .catch((e: BusinessError) => {
                console.log('error: ' + JSON.stringify(e));
                Utils.emitEvent(e.code + e.message, 10013)
              })
          } catch (error) {
            console.error(error.code + error.message);
          }
        })
        .key('promise_origin_error_1')

      Button('promise_origin_error_2')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage('测试')
              .then(quota => {
                console.log('quota: ' + quota);
              })
              .catch((e: BusinessError) => {
                console.log('error: ' + JSON.stringify(e));
                Utils.emitEvent(e.code + e.message, 10014)
              })
          } catch (error) {
            console.error(error.code + error.message);
          }
        })
        .key('promise_origin_error_2')

      Button('promise_origin_null')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage(null)
              .then(quota => {
                console.log('quota: ' + quota);
              })
              .catch((e: BusinessError) => {
                console.log('error: ' + JSON.stringify(e));
              })
          } catch (error) {
            console.error(error.code + error.message);
            Utils.emitEvent(error.code + error.message, 10015)
          }
        })
        .key('promise_origin_null')

      Button('promise_origin_undefined')
        .onClick((event: ClickEvent) => {
          try {
            webview.WebStorage.getOriginUsage(undefined)
              .then(quota => {
                console.log('quota: ' + quota);
              })
              .catch((e: BusinessError) => {
                console.log('error: ' + JSON.stringify(e));
              })
          } catch (error) {
            console.error(error.code + error.message);
            Utils.emitEvent(error.code + error.message, 10016)
          }
        })
        .key('promise_origin_undefined')


      Web({ src: $rawfile('GetOrigin.html'), controller: this.controller })
        .databaseAccess(true)
    }
  }
}