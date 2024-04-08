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
@Entry
@Component
struct TextPickerDialogExampleA {
  private select: number | number[] = 2
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']

  build() {
    Row() {
      Column() {       
        Button("TextPickerDialog按esc弹窗逐层退出").key('TextPicker_dialog_B')
          .margin(20)
          .onClick(() => {
            TextPickerDialog.show({
              range: this.fruits,
              onWillAppear: () => {
                var eventData = {
                  data: {
                    "action": 'onWillAppear'
                  }
                }
                let event = {
                  eventId: 50001,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onWillAppear()")
              },
              onDidAppear: () => {
                var eventData = {
                  data: {
                    "action": 'onDidAppear'
                  }
                }
                let event = {
                  eventId: 50002,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onDidAppear()")
              },
              onWillDisappear: () => {
                var eventData = {
                  data: {
                    "action": 'onWillDisappear'
                  }
                }
                let event = {
                  eventId: 50003,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onWillDisappear()")
              },
              onDidDisappear: () => {
                var eventData = {
                  data: {
                    "action": 'onDidDisappear'
                  }
                }
                let event = {
                  eventId: 50004,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onDidDisappear()")
              },
            })
          })
      }.width('100%')
    }.height('100%')
  }
}