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

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { temp } from '../../test/Const';
import { LocalContext } from '../../test/GloablConfig';
import { URL, URL3 } from './ConstConfig';

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
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  ports: webview.WebMessagePort[] = [];
  nativePort: webview.WebMessagePort | null = null;
  @State msg1: string = '';
  @State msg2: string = '';
  message: webview.WebMessageExt = new webview.WebMessageExt();
  @State testObjtest: TestObj = new TestObj();

  build(){
    Column() {
      Button('SendToH5 setArrayBuffer').margin({
        top: 10,
      })
        .key('010')
        .onClick(() => {
          try {
            try {
              this.message.setType(4);
              this.message.setArrayBuffer(temp);
            } catch (e) {
              console.error(`In ArkTS side send message catch error, ErrorCode: ${(e as BusinessError).code},` +
                `Message: ${(e as BusinessError).message}`);
              LocalContext.context.eventHub.emit('SetArrayBufferTest-error', e.code, e.message)
            }
          } catch (error) {
            console.error(`In ArkTS side send message catch error, ErrorCode: (errorasBusinessError).code,Message:
            {(error as BusinessError).code},  Message: {(error as BusinessError).message}`);
          }
        })

      Button('SendToH5 setError')
        .key('0091')
        .onClick(() => {
          console.log('In ArkTS side send true start');
          try {
            throw new ReferenceError('ReferenceError');
          } catch (ex) {
            try {
              this.message.setType(6);
              this.message.setError(temp);
            } catch (e) {
              console.error(`In ArkTS side send message catch error, ErrorCode: ${(e as BusinessError).code},Message:
            ${(e as BusinessError).code}`);
              LocalContext.context.eventHub.emit('SetErrorTest-error', e.code, e.message)
            }
            console.error(`In ArkTS side send message catch error, ErrorCode: ${(ex as BusinessError).code},Message:
            ${(ex as BusinessError).code}`);
          }
        })

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd(() => {
          console.log('init start');
          this.ports = this.controller.createWebMessagePorts(true);
          this.controller.postMessage('init_web_messageport', [this.ports[1]], '*');
          this.nativePort = this.ports[0];
          this.nativePort.onMessageEventExt((result) => {
            console.log('message');
            try {
              let type = result.getType();
              console.log('type:' + type);
              switch (type) {
                case webview.WebMessageType.STRING: {
                  this.msg1 = 'type:' + typeof (result.getString());
                  this.msg2 = 'getString:' + ((result.getString()));
                  break;
                }
                case webview.WebMessageType.NUMBER: {
                  this.msg1 = 'type:' + typeof (result.getNumber());
                  this.msg2 = 'getNumber:' + ((result.getNumber()));
                  break;
                }
                case webview.WebMessageType.BOOLEAN: {
                  this.msg1 = 'type:' + typeof (result.getBoolean());
                  this.msg2 = 'getBoolean:' + ((result.getBoolean()));
                  break;
                }
                case webview.WebMessageType.ARRAY_BUFFER: {
                  this.msg1 = 'result type:' + typeof (result.getArrayBuffer());
                  this.msg2 = 'result getArrayBuffer byteLength:' + ((result.getArrayBuffer().byteLength));
                  break;
                }
                case webview.WebMessageType.ARRAY: {
                  this.msg1 = 'type:' + typeof (result.getArray());
                  this.msg2 = 'getArray:' + result.getArray();
                  break;
                }
                case webview.WebMessageType.ERROR: {
                  this.msg1 = 'type:' + typeof (result.getError());
                  this.msg2 = 'getError:' + result.getError();
                  break;
                }
                default: {
                  this.msg1 = 'end, type:' + type;
                  break;
                }
              }
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          });
        })
    }
  }
}