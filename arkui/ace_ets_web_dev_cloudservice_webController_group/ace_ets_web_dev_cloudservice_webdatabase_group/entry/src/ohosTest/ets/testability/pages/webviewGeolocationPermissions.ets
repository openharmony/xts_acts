/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';
import business_error, { BusinessError } from '@ohos.base';


@Entry
@Component
struct webviewGeolocationPermissions {
  controller: WebviewController = new webview.WebviewController();
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth : number = 300;
  @State nodeHeight : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  origin: string = 'file:///';
  area?: Area
  @State emitKey: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webviewGeolocationPermissionsButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.isShouldOverlay = true
          this.isCallback = false
          await Utils.sleep(2000)

          // 以下测试
          switch (this.emitKey) {
            case 'emitWebviewAddGeolocationPermissions': {
              try {
                webview.GeolocationPermissions.allowGeolocation(this.origin, true);
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.error(`addGeolocationPermissions error, ErrorCode: ${(error as BusinessError).code},
                                  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent('fail', 26001);
                    return;
                  }
                  if (!result) {
                    Utils.emitEvent('fail', 26001);
                  }
                }, true)
                Utils.emitEvent('success', 26001);
              } catch (error) {
                Utils.emitEvent('fail', 26001);
              }
              break;
            }
            case 'emitWebviewDeleteGeolocationPermissions': {
              try {
                // 授权网站使用地理位置接口
                webview.GeolocationPermissions.allowGeolocation(this.origin, true);
                // 删除网站使用地理位置接口权限
                webview.GeolocationPermissions.deleteGeolocation(this.origin, true);
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.error(`deleteGeolocationPermissions error, ErrorCode: ${(error as BusinessError).code},
                                  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent('success', 26002);
                    return;
                  }
                  Utils.emitEvent('fail', 26002);
                }, true)
              } catch (error) {
                Utils.emitEvent('fail', 26002);
              }
              break;
            }
            case 'emitWebviewDeleteAllGeolocationPermissions': {
              try {
                // 授权网站使用地理位置接口
                webview.GeolocationPermissions.allowGeolocation(this.origin, true);
                // 删除所有网站使用地理位置接口权限
                webview.GeolocationPermissions.deleteAllGeolocation(true);
                // 获取已存储地理位置权限状态的所有源信息
                webview.GeolocationPermissions.getStoredGeolocation(true)
                  .then(origins => {
                    if (origins.length > 0) {
                      Utils.emitEvent('fail', 26003);
                    }
                  }).catch((error: BusinessError) => {
                  console.error(`getStoredGeolocationPromise error, ErrorCode: ${error.code},
                                Message: ${error.message}`);
                  Utils.emitEvent('fail', 26003);
                });
                Utils.emitEvent('success', 26003);
              } catch (error) {
                Utils.emitEvent('fail', 26003);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller, incognitoMode: true })
        .databaseAccess(true)
    }
  }
}