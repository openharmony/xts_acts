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


import {
  ColorMetrics,
  MultiCapsuleSegmentButtonV2,
  SegmentButtonV2Items
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct MultiCapsuleSegmentButtonV2Example {
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'a' },
    { text: 'b' },
    { text: 'c' },
    { text: 'd' },
  ]);
  @Local selectedIndexes: number[] = [];
  @Local itemBackgroundColor: ColorMetrics = ColorMetrics.resourceColor(Color.Red);
  @Local itemBackgroundEffect: BackgroundEffectOptions = {
    radius: 10,
    saturation: 25,
    brightness: 1.5,
    color: '#FF00FF',
    adaptiveColor: AdaptiveColor.AVERAGE,
    blurOptions: { grayscale: [20, 40] },
    policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
    inactiveColor: '#0000FF'
  };
  @Local itemBackgroundBlurStyle: BlurStyle = BlurStyle.Thin;
  @Local itemBackgroundBlurStyleOptions: BackgroundBlurStyleOptions =
    { policy: BlurStyleActivePolicy.ALWAYS_INACTIVE, inactiveColor: '#CCCCCC' };

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('' + this.selectedIndexes)
          .key('selectedIndexesTest001')
        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: this.selectedIndexes,
          $selectedIndexes: (selectedIndexes) => {
            this.selectedIndexes = selectedIndexes
            console.log('selectIndex---' + selectedIndexes)
          },
          itemBackgroundColor: this.itemBackgroundColor,
          itemBackgroundEffect: this.itemBackgroundEffect,
        })
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding(8)
          .width('100%')
          .key('MCSegmentButtonSelectedIndexesId001')

        Flex({ wrap: FlexWrap.Wrap }) {
          Button('[0]')
            .onClick(() => {
              this.selectedIndexes = [0];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId001')
          Button('[1]')
            .onClick(() => {
              this.selectedIndexes = [1];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId002')
          Button('[2]')
            .onClick(() => {
              this.selectedIndexes = [2];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId003')
          Button('[3]')
            .onClick(() => {
              this.selectedIndexes = [3];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId004')
          Button('[-1]')
            .onClick(() => {
              this.selectedIndexes = [-1];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId005')
        }

        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: [0, 2],
          itemBackgroundColor: this.itemBackgroundColor,
          itemBackgroundBlurStyle: this.itemBackgroundBlurStyle,
          itemBackgroundBlurStyleOptions: this.itemBackgroundBlurStyleOptions
        })
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding(8)
          .width('100%')
          .key('MCSegmentButtonBlurStyleId001')
      }
      .constraintSize({ minHeight: '100%' })
      .justifyContent(FlexAlign.Start)
      .padding(16)
    }
    .backgroundColor('#f1f3f5')
    .width('100%')
    .height('100%')
  }
}
