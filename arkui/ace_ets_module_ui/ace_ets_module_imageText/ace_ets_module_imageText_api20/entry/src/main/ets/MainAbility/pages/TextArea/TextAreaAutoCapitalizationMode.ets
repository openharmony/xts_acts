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

@Entry
@Component
struct TextAreaAutoCapitalizationMode {

  build() {
    Column({ space: 1 }) {
      TextArea({
        text: 'AutoCapitalizationMode.NONE',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_NONE')
        .autoCapitalizationMode(AutoCapitalizationMode.NONE)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.WORDS',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_WORDS')
        .autoCapitalizationMode(AutoCapitalizationMode.WORDS)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.SENTENCES',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_SENTENCES')
        .autoCapitalizationMode(AutoCapitalizationMode.SENTENCES)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.ALL_CHARACTERS',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_ALL_CHARACTERS')
        .autoCapitalizationMode(AutoCapitalizationMode.ALL_CHARACTERS)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode: default',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_default')
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode: undefined',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationMode_undefined')
        .autoCapitalizationMode(undefined)
        .height('5%')

      TextArea({
        text:'AutoCapitalizationMode: 0',
      })
        .id('TextArea_AutoCapitalizationMode_0')
        .height('5%')
        .autoCapitalizationMode(0)
    }.height('100%')
  }
}