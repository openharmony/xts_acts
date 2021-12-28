/*
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
 
@Entry
@Component
struct slider {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Slider page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Slider({
          value: 40,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .blockColor('#FFFF0000')
          .selectedColor('#FF0000FF')
          .trackColor('#FF808080')
          .showTips(false)
          .showSteps(false)
          .width("200")
          .height("100")
          .key('slider1')
        Slider({
          value: 40,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        })
          .blockColor(Color.Red)
          .selectedColor(Color.Blue)
          .trackColor(Color.Gray)
          .showTips(true)
          .showSteps(true)
          .key('slider2')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

