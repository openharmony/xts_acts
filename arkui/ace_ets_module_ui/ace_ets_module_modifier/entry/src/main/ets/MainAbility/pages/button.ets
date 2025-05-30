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
import { ButtonModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ButtonModifier {
  applyNormalAttribute(instance: ButtonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.fontSize(13)
  }
}

class CustomModifier2 extends ButtonModifier {
  applyNormalAttribute(instance: ButtonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.labelStyle({ overflow: TextOverflow.Clip })
  }
}


@Entry
@Component
struct ButtonExample {
  @State buttonModifier: ButtonModifier = new CustomModifier()
    .type(ButtonType.Circle)
    .stateEffect(true)
    .fontColor(0xCCCCCC)
    .fontSize(12)
    .fontWeight(FontWeight.Normal)
    .fontFamily('cursive')
    .fontStyle(FontStyle.Normal)
  @State buttonModifier2: ButtonModifier = new CustomModifier2()
    .labelStyle({ overflow: TextOverflow.Clip })
  @State buttonTypeValue: ButtonType = ButtonType.Normal;
  @State fontSizeValue: string = '20px';
  @State fontColorValue: Color = Color.Black;
  @State text: string = '';
  @State onClickValue: boolean = false;

  onPageShow() {
    console.info('Button page show called');
  }

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.buttonModifier as CustomModifier).onChange1();
        (this.buttonModifier2 as CustomModifier).onChange1();
      }).key("changeButton")

      Button('Ok', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button')
        .attributeModifier(this.buttonModifier as CustomModifier)

      Button('Ok2', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button2')
        .attributeModifier(this.buttonModifier2 as CustomModifier)
    }

  }
}