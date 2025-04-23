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

import { SegmentButtonV2Items, SegmentButtonV2Item, TabSegmentButtonV2 } from '@ohos.arkui.advanced.SegmentButtonV2'
import { ImageModifier, TextModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'

@Entry
@ComponentV2
struct SegmentButtonV20010 {
  @Local selectedIndex: number = 0
  @Local items: SegmentButtonV2Items = new SegmentButtonV2Items([
    {
      text: '搜索',
      icon: $r('sys.media.ohos_ic_public_search_filled'),
      enabled: true,
      textModifier: new TextModifier().fontColor('#FFFFFF00'),
      iconModifier: new ImageModifier().backgroundColor('#FFFFA500'),
      accessibilityText: '搜索',
      accessibilityDescription: '搜索按钮',
      accessibilityLevel: 'auto'
    },
    {
      text: '扫描',
      icon: $r('sys.media.ohos_ic_public_scan'),
      enabled: false,
      accessibilityText: '扫描',
      accessibilityDescription: '扫描按钮',
      accessibilityLevel: 'no'
    },
    {
      text: '分享',
      icon: $r('sys.media.ohos_ic_public_share'),
      accessibilityText: '分享',
      accessibilityDescription: '分享按钮',
      accessibilityLevel: 'yes'
    },
    {
      text: '反馈',
      symbol: $r('sys.symbol.fade'),
      symbolModifier: new SymbolGlyphModifier().fontWeight(FontWeight.Bolder),
      accessibilityText: '反馈',
      accessibilityDescription: '反馈按钮',
      accessibilityLevel: 'no-hide-descendants'
    }
  ])
  @Local segItems: SegmentButtonV2Items = new SegmentButtonV2Items([])
  @Local segItem1: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: '关闭1',
      icon: $r('sys.media.ohos_ic_public_close'),
      enabled: true,
      textModifier: new TextModifier().fontColor('#FFFFFF00'),
      iconModifier: new ImageModifier().backgroundColor('#FFFFA500'),
      accessibilityText: '关闭1',
      accessibilityDescription: '关闭1按钮',
      accessibilityLevel: 'auto'
    }
  )
  @Local segItem2: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: '关闭2',
      icon: $r('sys.media.ohos_ic_public_close'),
      enabled: false,
      accessibilityText: '关闭2',
      accessibilityDescription: '关闭2按钮',
      accessibilityLevel: 'no-hide-descendants'
    }
  )
  @Local segItem3: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: '关闭3',
      icon: $r('sys.media.ohos_ic_public_close'),
      accessibilityText: '关闭3',
      accessibilityDescription: '关闭3按钮',
      accessibilityLevel: 'no'
    }
  )
  @Local segItem4: SegmentButtonV2Item = new SegmentButtonV2Item(
    {
      text: '关闭4',
      icon: $r('sys.media.ohos_ic_public_close'),
      accessibilityText: '关闭4',
      accessibilityDescription: '关闭4按钮',
      accessibilityLevel: 'yes'
    }
  )

  aboutToAppear(): void {
    this.segItems.push(this.segItem1)
    this.segItems.push(this.segItem2)
    this.segItems.push(this.segItem3)
    this.segItems.push(this.segItem4)
  }

  build() {
    Column() {
      TabSegmentButtonV2({
        items: this.items,
        selectedIndex: this.selectedIndex,
        $selectedIndex: (selectedIndex) => {
          this.selectedIndex = this.selectedIndex
        },
        itemMinFontScale: 0.1,
        itemMaxFontScale: 1
      })
      TabSegmentButtonV2({
        items: this.segItems,
        selectedIndex: this.selectedIndex,
        onItemClicked: (index: number) => {
          this.selectedIndex = index
        }
      })
    }
  }
}
