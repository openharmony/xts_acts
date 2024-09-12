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
struct WebMessageTest {
  controller: webview.WebviewController = new webview.WebviewController();
  origin: string = 'resource://rawfile/';

  build(){
    Column() {
      Button('callBack_false_getOriginQuota')
        .key('callBack_false_getOriginQuota')
        .onClick(() => {
          try {
            this.origin = 'X&X'
            webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                console.log(error.code + error.message)
                Utils.emitEvent(error.code + error.message, 10003)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
          }
        })

      Button('callBack_null_getOriginQuota')
        .key('callBack_null_getOriginQuota')
        .onClick(() => {
          try {
            webview.WebStorage.getOriginQuota(null, (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                console.log(error.code + error.message)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
            console.log(error.code + error.message)

            Utils.emitEvent(error.code + error.message, 10004)
          }
        })

      Button('callBack_undefined_getOriginQuota')
        .key('callBack_undefined_getOriginQuota')
        .onClick(() => {
          try {
            webview.WebStorage.getOriginQuota(undefined, (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                console.log(error.code + error.message)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
            Utils.emitEvent(error.code + error.message, 10005)
          }
        })

      Button('promise_false_getOriginQuota')
        .key('promise_false_getOriginQuota')
        .onClick(() => {
          try {
            webview.WebStorage.getOriginQuota('X&X', (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 10006)
                console.log(error.code + error.message)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
          }
        })

      Button('promise_null_getOriginQuota')
        .key('promise_null_getOriginQuota')
        .onClick(() => {
          try {
            webview.WebStorage.getOriginQuota(null, (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                console.log(error.code + error.message)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10007)
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
          }
        })

      Button('promise_undefined_getOriginQuota')
        .key('promise_undefined_getOriginQuota')
        .onClick(() => {
          try {
            webview.WebStorage.getOriginQuota(undefined, (error, quota) => {
              if (error) {
                console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
                console.log(error.code + error.message)
                return;
              }
              console.log('quota: ' + quota);
            })
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 10008)
            console.error(`ErrorCode: {(error as BusinessError).code},  Message: {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
          }
        })

      Web({ src: $rawfile('GetOrigin.html'), controller: this.controller })
        .databaseAccess(true)
    }
  }
}