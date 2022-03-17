// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

@Entry
@Component
struct KeyEventExample {
  @State text: string = ''
  @State textOne: string = ''
  @State textTwo: string = ''
  @State textThree: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Button('KeyEvent').backgroundColor(0x2788D9)
        .onKeyEvent((event: KeyEvent) => {
          if (event.type === KeyType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === KeyType.Up) {
            this.eventType = 'Up'
          }
          if (event.type === keySource.Unknown) {
            this.eventType = 'Unknown'
          }
          if (event.type === keySource.Keyboard) {
            this.eventType = 'Keyboard'
          }
          console.info(this.text = 'KeyType:' + this.eventType + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText)
          console.info(this.textOne = 'KeySource:' + event.keySource + '\ndeviceId:' + event.deviceId + '\nmetaKey:' + event.metaKey + '\ntimeStamp:' + event.timestamp)
          console.info(this.textTwo = 'KeyType:' + this.keySource + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText)
          console.info(this.textThree = 'KeyType:' + this.keySource + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText)
          stopPropagation: () => {
            console.info('stopPropagation')
          }
        })
      Text(this.text).padding(15)
    }.height(300).width('100%').padding(35)
  }
}