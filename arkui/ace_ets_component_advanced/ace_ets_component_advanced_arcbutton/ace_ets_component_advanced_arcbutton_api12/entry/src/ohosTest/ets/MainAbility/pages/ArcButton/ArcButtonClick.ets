/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ComponentContent, LengthMetrics, ColorMetrics, LengthUnit} from '@ohos.arkui.node';
import {
ArcButton,
CommonArcButtonOptions,
  ArcButtonOptions,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ArkButtonClickEffectStyle,
  ArcButtonTypeMode
} from '@ohos.arkui.advanced.ArcButton';

@Entry
@ComponentV2
struct ArcButtonDemo {
  @Local options: ArcButtonOptions = new ArcButtonOptions({
      resourceText: 'arcbutton',
      type: ArcButtonTypeMode.TOP_EDGE,
      touchEffect: ArkButtonClickEffectStyle.LIGHT,
      styleMode: ArcButtonStyleMode.NORMAL_LIGHT,
      backgroundColor: ColorMetrics.resourceColor(Color.Blue),
      shadowColor: ColorMetrics.resourceColor('#FF4151'),
      shadowEnabled: true,
      textSize: new LengthMetrics(19, LengthUnit.FP),
      textColor: ColorMetrics.resourceColor(Color.Green),
      pressedTextColor: ColorMetrics.resourceColor(Color.Yellow),
      textStyle: FontStyle.Italic,
      textFamily: 'HarmonyOS Sans'
  })
  @Local options1: ArcButtonOptions = new ArcButtonOptions({
      resourceText: 'arcbutton1',
  })
  
    build() {
        Column() {
            Column(){
                ArcButton({ options: this.options })
                Button('Click Me First').onClick(()=>{
                  this.options.resourceText = '白色风车'
                })
            }.width(200).borderWidth(5).key('ChipOnClick')

            Column(){
                ArcButton({ options: this.options1 })
                Button('Click Me Second')
            }.width(200).borderWidth(5).key('ChipOnClick')
        }
    }
}