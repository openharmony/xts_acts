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

 class TextInputModifier1 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoSpacing(true)
  }
}

class TextInputModifier2 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoSpacing(false)
  }
}

class TextInputModifier3 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoSpacing(undefined)
  }
}

@Entry
@Component
struct TextInputEnableAutoSpacing {
  @State TextInputModifier1: TextInputModifier1 = new TextInputModifier1()
  @State TextInputModifier2: TextInputModifier2 = new TextInputModifier2()
  @State TextInputModifier3: TextInputModifier3 = new TextInputModifier3()

  build() {
    Column({ space: 1 }) {
      TextInput({
        text:'TextInput：enableAutoSpacing(true)',
      })
        .id('TextInput_enableAutoSpacing_true')
        .enableAutoSpacing(true)
        .height('5%')

      TextInput({
        text:'TextInput：enableAutoSpacing(false)',
      })
        .id('TextInput_enableAutoSpacing_false')
        .enableAutoSpacing(false)
        .height('5%')

      TextInput({
        text:'TextInput：enableAutoSpacing(default)',
      })
        .id('TextInput_enableAutoSpacing_default')
        .height('5%')

      TextInput({
        text:'TextInput：enableAutoSpacing(undefined)',
      })
        .id('TextInput_enableAutoSpacing_undefined')
        .enableAutoSpacing(undefined)
        .height('5%')

      TextInput({
        text:'TextInputModifier: true',
      })
        .attributeModifier(this.TextInputModifier1)
        .id('TextInputModifier_enableAutoSpacing_true')
        .height('5%')
        .borderWidth(1)

      TextInput({
        text:'TextInputModifier: false',
      })
        .attributeModifier(this.TextInputModifier2)
        .id('TextInputModifier_enableAutoSpacing_false')
        .height('5%')
        .borderWidth(1)

      TextInput({
        text:'TextInputModifier: undefined',
      })
        .attributeModifier(this.TextInputModifier3)
        .id('TextInputModifier_enableAutoSpacing_undefined')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}