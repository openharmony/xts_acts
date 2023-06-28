/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct SR000HQURK {
  private arr: string[] = ['0', '1','2', '3', '4', '5', '6', '7', '8', '9',
    '-', '=', '`', '[', ']', ';', '\'', ',', '.', '/', ' ', '*', '+',
    'B','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','W']
  private functionKey: string[] = Object.keys(FunctionKey)
    .filter(key => typeof FunctionKey[key] === 'number')

  sendEvent(message, eventId) {
    var eventData = {
      data: {
        "msg": message
      }
    }
    let event = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  baseEvent = 62000
  baseEvent2 = 73000

  build() {
    Scroll() {
      Column({ space: 10 }) {
        ForEach(this.arr, (item, index) => {
          Button("Ctrl" + "+" + item)
            .keyboardShortcut(item, [ModifierKey.CTRL])
          .onClick(() => {
            this.sendEvent('Ctrl_' + item, this.baseEvent + index)
          })
          .key('SR000HQURK_Button_' + index)
        }, item => item)

        ForEach(this.functionKey, (item, index) => {
          Button("CTRL + " + item)
            .keyboardShortcut(<FunctionKey><unknown>FunctionKey[item], [ModifierKey.CTRL])
            .onClick(() => {
              this.sendEvent('Ctrl_' + item, this.baseEvent2 + index)
            })
            .width("80%")
            .key('SR000HQURK2_Ctrl_' + item)
        }, item => item)

        Button("Shift+1")
          .keyboardShortcut("1", [ModifierKey.SHIFT])
          .onClick(() => {
            this.sendEvent('Shift_1', 72002)
          })
        Button("Alt+Q")
          .keyboardShortcut("Q",[ModifierKey.ALT])
          .onClick(() => {
            this.sendEvent('Alt_Q', 72003)
          })

      }.width("100%")
    }
  }
}