/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct UIShowDialog2 {
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  build() {
    Column({ space: 10 }){
      Button('UIShowDialog_Effect001')
        .id('UIShowDialog_Effect001')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundEffect: {
                radius: 40,
                saturation: 25,
                brightness: 2,
                color: Color.Pink,
                adaptiveColor: AdaptiveColor.DEFAULT,
                policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
                inactiveColor:Color.Blue,
                blurOptions: {
                  grayscale: [20,20]
                }
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
      Button('UIShowDialog_Effect002')
        .id('UIShowDialog_Effect002')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundEffect: {
                radius: undefined,
                saturation: undefined,
                brightness: undefined,
                color: undefined,
                adaptiveColor: undefined,
                policy:undefined,
                inactiveColor:undefined,
                blurOptions: undefined,
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
      Button('UIShowDialog_Effect003')
        .id('UIShowDialog_Effect003')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundEffect: {
                radius: null,
                saturation: null,
                brightness: null,
                color: null,
                adaptiveColor: null,
                policy:null,
                inactiveColor:null,
                blurOptions: null,
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}