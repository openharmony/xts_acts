/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
@Entry
@Component
struct Stack_Text {
  @State types: TextDataDetectorType[] = [];
  @State text: string = ''
  private selectedTime: Date = new Date('2022-07-22T08:00:00')

  build() {
    Column() {
      Text('First child, show in bottom').width('90%')
        .enableDataDetector(true).key('Stack_Text')
        .dataDetectorConfig({types : this.types, onDetectResultUpdate: (result: string)=>{}})

      TextInput().enableAutoFill(true).passwordRules('1111').key('Stack_TextInput')
        .type(InputType.NEW_PASSWORD)
        .type(InputType.NUMBER_PASSWORD)
        .type(InputType.USER_NAME)

      Row() {
        Button('Emphasized', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.EMPHASIZED });
        Button('Normal', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.NORMAL });
        Button('Textual', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.TEXTUAL });
      }
    }
  }
}