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

@Entry
@Component
struct AccessibilityHoverDemo {
  build() {
    Column({ space: 20 }) {
      Text('checkable测试(true)').accessibilityChecked(true);
      Text('checkable测试(false)').accessibilityChecked(false);
      Text('checkable测试(undefined)').accessibilityChecked(undefined);

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected true')
          .accessibilitySelected(true)
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected false')
          .accessibilitySelected(false)
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected undefined')
          .accessibilitySelected(undefined)
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox change is' + value)
          })
          .width(30)
          .height(30)
          .accessibilityChecked(true)
          .accessibilitySelected(undefined)
        Text('accessibilityChecked true Select undefined')
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox change is' + value)
          })
          .width(30)
          .height(30)
          .accessibilityChecked(false)
          .accessibilitySelected(undefined)
        Text('accessibilityChecked false Select undefined')
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox change is' + value)
          })
          .width(30)
          .height(30)
          .accessibilityChecked(undefined)
          .accessibilitySelected(undefined)
        Text('accessibilityChecked undefined Select undefined')
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected true Checked undefined')
          .accessibilitySelected(true)
          .accessibilityChecked(undefined)
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected false Checked undefined')
          .accessibilitySelected(false)
          .accessibilityChecked(undefined)
      }

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text('accessibilitySelected undefined Checked undefined')
          .accessibilitySelected(undefined)
          .accessibilityChecked(undefined)
      }
    }
  }
}
