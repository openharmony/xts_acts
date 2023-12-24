
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

class MyButtonModifier implements AttributeModifier<TextAttribute> {
  isDark: boolean = false
  disable
  applyFocusedAttribute(instance: TextAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Green)
    } else {
      instance.backgroundColor(Color.Red)
    }
  }
  applyDisabledAttribute(instance: TextAttribute): void {
    if (this.isDark) {
      instance.fontSize(26)
    } else {
      instance.fontSize(14)
    }
  }
  applySelectedAttribute(instance: TextAttribute): void {
    if (this.isDark) {
      instance.fontWeight(700)
    } else {
      instance.fontSize(300)
    }
  }
}

@Entry
@Component
struct AttributeModifierDemo3API {
  @State modifier: MyButtonModifier = new MyButtonModifier()

  build() {
    Row() {
      Column() {
        Text("TTTTTT").key('AttributeModifierDemo3APIButton').width(100).height(100)
          .attributeModifier(this.modifier)

      }
      .width('100%')
    }
    .height('100%')
  }
}