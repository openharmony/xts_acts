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
import { SymbolSpanModifier } from '@kit.ArkUI';

@Entry
@Component
struct SymbolSpanModifier1 {
  @State value: string = 'init'
  @State modifier: SymbolSpanModifier = new SymbolSpanModifier($r('sys.symbol.ohos_wifi')).fontSize(100);

  aboutToAppear(): void {
    this.value = (typeof SymbolSpanInstance).toString()
  }

  build() {
    Column({ space: 5 }) {
      Text() {
        SymbolSpan(undefined).attributeModifier(this.modifier)
          .id('SymbolSpanModifier_get_fontSize')
          .height('20%')
      }

      TextArea({ text: this.value })
        .id('SymbolSpanModifier_get_type')
        .height('10%')
    }
  }
}