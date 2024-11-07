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
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';

class TestObj {
  test(str: string): ArrayBuffer{
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct WebMessageExtTest {
  controller: webview.WebviewController = new webview.WebviewController();
  scroller: Scroller = new Scroller()
  ports: webview.WebMessagePort[] = [];
  nativePort: webview.WebMessagePort | null = null;
  message: webview.WebMessageExt = new webview.WebMessageExt();
  @State type: string = ''
  @State method: string = ''
  @State testObjtest: TestObj = new TestObj();

  build(){
    Scroll(this.scroller) {
      Column() {
        Row() {
          Button('Boolean_1').margin({
            top: 30,
          })
            .key('setBoolean_null')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(3);
                  this.message.setBoolean(null);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error('mqf' + error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10025)
              }
            })

          Button('Boolean_2').margin({
            top: 30,
          })
            .key('setBoolean_not_match')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(2);
                  this.message.setBoolean(true);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error('mqf' + error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10026)
              }
            })
        }

        Row() {
          Button('Number_1').margin({
            top: 30,
          })
            .key('setNumber_null')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(2);
                  this.message.setNumber(null);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10027)
              }
            })

          Button('Number_2').margin({
            top: 30,
          })
            .key('setNumber_not_match')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(1);
                  this.message.setNumber(123);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10028)
              }
            })
        }

        Row() {
          Button('String_1').margin({
            top: 30,
          })
            .key('setString_null')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(1);
                  this.message.setString(null);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10029)
              }
            })

          Button('String_2').margin({
            top: 30,
          })
            .key('setString_not_match')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(2);
                  this.message.setString('test');
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10030)
              }
            })
        }

        Row() {
          Button('Type_1').margin({
            top: 30,
          })
            .key('setType_null')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(null);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10031)
              }
            })

          Button('Type_2').margin({
            top: 30,
          })
            .key('setType_not_match')
            .onClick(() => {
              try {
                console.log('In ArkTS side send true start');
                if (this.nativePort) {
                  this.message.setType(10);
                  this.nativePort.postMessageEventExt(this.message);
                }
              } catch (error) {
                console.error(error.code + error.message);
                Utils.emitEvent(error.code + error.message, 10032)
              }
            })
        }

        Row() {
          Button('Array').onClick((event: ClickEvent) => {
            let result: webview.WebMessageExt = new webview.WebMessageExt();
            result.setType(1);
            try {
              result.getArray()
            } catch (error) {
              console.log(error.code + error.message)
              Utils.emitEvent(error.code + error.message, 10033)
            }
          })
            .key('getArray')

          Button('ABuffer').onClick((event: ClickEvent) => {
            let result: webview.WebMessageExt = new webview.WebMessageExt();
            result.setType(1);
            try {
              result.getArrayBuffer()
            } catch (error) {
              console.log(error.code + error.message)
              Utils.emitEvent(error.code + error.message, 10034)
            }
          })
            .key('getArrayBuffer')
        }

        Row() {
          Button('Boolean').onClick((event: ClickEvent) => {
            let result: webview.WebMessageExt = new webview.WebMessageExt();
            result.setType(1);
            try {
              result.getBoolean()
            } catch (error) {
              console.log(error.code + error.message)
              Utils.emitEvent(error.code + error.message, 10035)
            }
          })
            .key('getBoolean')

          Button('Number').onClick((event: ClickEvent) => {
            let result: webview.WebMessageExt = new webview.WebMessageExt();
            result.setType(1);
            try {
              result.getNumber()
            } catch (error) {
              console.log(error.code + error.message)
              Utils.emitEvent(error.code + error.message, 10036)
            }
          })
            .key('getNumber')
        }

        Button('String').onClick((event: ClickEvent) => {
          let result: webview.WebMessageExt = new webview.WebMessageExt();
          result.setType(2);
          try {
            result.getString()
          } catch (error) {
            console.log(error.code + error.message)
            Utils.emitEvent(error.code + error.message, 10037)
          }
        })
          .key('getString')

        Web({ src: $rawfile('WebMessageExt.html'), controller: this.controller })
          .onPageEnd(() => {
            console.log('In ArkTS side message onPageEnd init message channel');
            this.ports = this.controller.createWebMessagePorts(true);
            this.controller.postMessage('init_web_messageport', [this.ports[1]], '*');
            this.nativePort = this.ports[0];
            this.nativePort.onMessageEventExt((result) => {
              console.log('In ArkTS side got message');
              try {
                let type = result.getType();
                console.log('In ArkTS side getType:' + type);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
            });
          })
      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical)
  }
}