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
import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Util';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Geolocation {
  @State str: string = ''
  controller: webview.WebviewController = new webview.WebviewController();
  @State src: string | Resource = 'www.example.com'
  @State incognitoMode: boolean = true
  origin: string = 'file:///';

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {
      Button('Geolocation')
        .key('Geolocation')
        .onClick(() => {
          switch (this.str) {
            case 'testErrorCodeMessage4100':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, origins) => {
                  if (error) {
                    console.log('error code' + error.code)
                    Utils.emitEvent(error.code + error.message, 300)
                    return;
                  }
                  console.log('success  origin is:' + this.origin)
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 300)
              }
              break;
            case 'testErrorCodeMessage4200':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(null, (error, origins) => {
                  if (error) {
                    console.log('error code' + error.code)
                    Utils.emitEvent(error.code + error.message, 301)
                    return;
                  }
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 301)
              }
              break;
            case 'testErrorCodeMessage4300':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin).then(result => {
                  console.log('getAccessibleGeolocationPromise result: ' + result);
                }).catch((e: BusinessError) => {
                  console.log('error code' + e.code)
                  Utils.emitEvent(e.code + e.message, 302)
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 302)
              }
              break;
            case 'testErrorCodeMessage4400':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin).then(result => {
                  console.log('getAccessibleGeolocationPromise result: ' + result);
                }).catch((e: BusinessError) => {
                  console.log('error code' + e.code)
                  Utils.emitEvent(e.code + e.message, 303)
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 303)
              }
              break;
            case 'testErrorCodeMessage4400':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(null).then(result => {
                  console.log('getAccessibleGeolocationPromise result: ' + result);
                }).catch((e: BusinessError) => {
                  console.log('error code' + e.code)
                  Utils.emitEvent(e.code + e.message, 303)
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 303)
              }
              break;
            case 'testErrorCodeMessage4500':
              try {
                webview.GeolocationPermissions.deleteGeolocation('你好');
                console.log('success deleteGeolocation:')
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 304)
              }
              break;
            case 'testErrorCodeMessage4600':
              try {
                webview.GeolocationPermissions.deleteGeolocation(null);
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 305)
              }
              break;
            case 'testErrorCodeMessage4700':
              try {
                webview.GeolocationPermissions.allowGeolocation('openharmony');
                Utils.emitEvent('true', 306)
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 306)
              }
              break;
            case 'testErrorCodeMessage4800':
              try {
                webview.GeolocationPermissions.allowGeolocation(null);
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 307)
              }
              break;
            case 'testErrorCodeMessage4900':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(undefined, (error, origins) => {
                  if (error) {
                    console.log('error code' + error.code)
                    Utils.emitEvent(error.code + error.message, 308)
                    return;
                  }
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 308)
              }
              break;
            case 'testErrorCodeMessage5000':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(undefined).then(result => {
                  console.log('getAccessibleGeolocationPromise result: ' + result);
                }).catch((e: BusinessError) => {
                  console.log('error code' + e.code)
                  Utils.emitEvent(e.code + e.message, 309)
                })
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code, 309)
              }
              break;
            case 'testErrorCodeMessage5100':
              try {
                webview.GeolocationPermissions.deleteGeolocation(undefined);
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 310)
              }
              break;
            case 'testErrorCodeMessage5200':
              try {
                webview.GeolocationPermissions.allowGeolocation(undefined);
              } catch (e) {
                console.log('err code:' + e.code)
                Utils.emitEvent(e.code + e.message, 311)
              }
              break;
          }
        })

      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
        .geolocationAccess(true)

    }
    .height('100%')
    .width('100%')
  }
}