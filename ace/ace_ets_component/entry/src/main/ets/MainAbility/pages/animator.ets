// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import Curves from '@ohos.curves';

@Entry
@Component
struct AnimatorTest {
  @State valueX: number = 0;
  @State valueY: number = 0;
  @State valueW: number = 100;
  @State valueH: number = 100;
  @State valueS: AnimationStatus = AnimationStatus.Initial;
  private curve1 = Curves.init(Curve.EaseIn);
  private curve2 = Curves.init(Curve.EaseOut);
  private curve3 = Curves.cubicBezier(0.1, 0.0, 0.1, 1.0);
  private curve4 = Curves.spring(100, 1, 228, 30);

  build() {
    Column() {
      Text('自定义动画')
        .position({ x: this.valueX, y: this.valueY })
        .size({ width: this.valueW, height: this.valueH })
        .fontSize(20)
      Animator('id')
        .duration(1000)
        .state(this.valueS)
        .key('animator')
        .curve(Curve.EaseOut)
        .fillMode(FillMode.Backwards)
        .iterations(0)
        .motion(SpringMotion.apply())
        .onFrame((value: number) => {
          console.log("animator onFrame init")
          this.valueX = 100 * this.curve1.interpolate(value)
          this.valueY = 100 * this.curve2.interpolate(value)
          this.valueW = 100 * this.curve3.interpolate(value)
          this.valueH = 100 * this.curve4.interpolate(value)
        })
        .onRepeat(() => {
          console.log("animator repeat init")
        })
      Row() {
        Button('Running')
          .onClick(() => {
            this.valueS = AnimationStatus.Running
          })
        Button('Paused')
          .onClick(() => {
            this.valueS = AnimationStatus.Paused
          })
        Button('Stopped')
          .onClick(() => {
            this.valueS = AnimationStatus.Stopped
          })
        Button('Initial')
          .onClick(() => {
            this.valueS = AnimationStatus.Initial
          })
      }
    }
  }
}

