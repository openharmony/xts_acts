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
@ComponentV2
struct CompuutedMonitor {
  @Local celsius: number = 20;
  @Local computedText1: number = 0;
  @Local computedText2: number = 0;

  @Computed
  get fahrenheit(): number {
    this.computedText1 += 1;
    return this.celsius * 9 / 5 + 32; // C -> F
  }

  @Computed
  get kelvin(): number {
    this.computedText2 += 1;
    return (this.fahrenheit - 32) * 5 / 9 + 273.15; // F -> K
  }

  @Monitor('kelvin')
  onKelvinMonitor(mon: IMonitor) {
    console.log('kelvin changed from ' + mon.value()?.before + ' to ' + mon.value()?.now);
  }

  build() {
    Column({ space: 20 }) {
      Row({ space: 20 }) {
        Button('-')
          .onClick(() => {
            this.celsius--;
          })
          .id('CompuutedMonitorButton1')

        Text(`Celsius ${this.celsius.toFixed(1)}`).fontSize(35).id('CompuutedMonitorText1')

        Button('+')
          .onClick(() => {
            this.celsius++;
          })
          .id('CompuutedMonitorButton2')
      }

      Text(`Fahrenheit ${this.fahrenheit.toFixed(2)}`).fontSize(50).id('CompuutedMonitorText2')
      Text(`Kelvin ${this.kelvin.toFixed(2)}`).fontSize(50).id('CompuutedMonitorText3')
      Text(this.computedText1.toString()).fontSize(50).id('CompuutedMonitorText4')
      Text(this.computedText2.toString()).fontSize(50).id('CompuutedMonitorText5')
    }
    .width('100%')
  }
}