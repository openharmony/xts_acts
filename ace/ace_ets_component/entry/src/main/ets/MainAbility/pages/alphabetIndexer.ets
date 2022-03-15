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
import events_emitter from '@ohos.emitter';
@Entry
@Component
struct AlphabetIndexerSample {
  private value: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
  'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  @State color: Color = Color.Red;
  @State fontSize: string = 20;
  @State fontWeight: FontWeight = FontWeight.Bolder;
  @State fontFamily: string = 'sans-serif';
  @State fontStyle: FontStyle = FontStyle.Italic;
  @State offSetX: number = 10
  @State offSetY: number = 10

  build() {
    AlphabetIndexer({ arrayValue: this.value, selected: 0 })
      .selectedColor(0xffffff)
      .selectedIndex(0)
      .popupColor(0xFFFAF0)
      .selectedBackgroundColor(0xCCCCCC)
      .popupBackground(0xD2B48C)
      .usingPopup(true)
      .selectedFont({ size: 16, weight: FontWeight.Bolder })
      .popupFont({ size: 30, weight: FontWeight.Bolder })
      .itemSize(28)
      .alignStyle(IndexerAlign.Left)
      .popupPosition({offsetX: this.offSetX,offsetY: this.offSetY})
      .onPopupSelected((index: number) =>{
        console.info('index on action')
      })
      .onSelected((index: number) => {
        console.info(this.value[index] + 'is choosen');
      })
      .onRequestPopupData((index: number) =>{
        return this.value
      })
      .margin({ left: 50 })
      .font({size: this.fontSize, weight: this.fontWeight, family: this.fontFamily, style: this.fontStyle })
      .color(this.color)
      .key('alphabetIndexer')
  }
  onPageShow() {
    console.info('alphabetIndexer page show called');
    var stateChangeEvent = {
      eventId: 71,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("alphabetIndexer page state change called:" + JSON.stringify(eventData));
      let font = JSON.parse(eventData.data.font);
      if(font) {
        this.fontSize = font.size;
        this.fontWeight = font.weight;
        this.fontFamily = font.family;
        this.fontStyle = font.style;
      }
    }
  }
}
