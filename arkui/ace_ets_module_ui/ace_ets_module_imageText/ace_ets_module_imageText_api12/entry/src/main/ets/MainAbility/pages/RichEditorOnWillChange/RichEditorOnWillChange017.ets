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
@Component
struct RichEditorOnWillChange017 {
  controller: RichEditorController = new RichEditorController();
  @State replacedSpansCallback: string = '';
  @State onWillChangeRangeBefore: string = '';
  @State onDidChangeRangeBefore: string = '';
  @State onDidRangeAfter: string = '';

  build() {

    Column() {

      Text('onDidChange rangeBefore:' + this.onDidChangeRangeBefore).id('onDidChange_rangeBefore')
      Text('onWillChange_rangeBefore:' + this.onWillChangeRangeBefore).id('onWillChange_rangeBefore')
      Text('replacedSpans Callback:' + this.replacedSpansCallback).id('replacedSpansCallback')
      Text('ondid rangeAfter:' + this.onDidRangeAfter).id('ondid_rangeAfter')

      Button('AddTextSpan').onClick(() => {
        this.controller.addTextSpan('01\n02\n03',
          {
            style:
            {
              fontColor: Color.Orange,
              fontSize: 30
            }
          })
      }).id('add_text_span')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abc',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.log('RichEditorController：onWillChange');
          console.log('RichEditorController：value' + JSON.stringify(value));
          this.onWillChangeRangeBefore = JSON.stringify(value.rangeBefore);
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans');
            console.log('RichEditorController item:' + JSON.stringify(item));
            console.log('RichEditorController spanPosition spanIndex:' + JSON.stringify(item.spanPosition.spanIndex));
            console.log('RichEditorController replacedSpans value:' + item.value);
            this.replacedSpansCallback = JSON.stringify(item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          value.richEditorDeleteSpans.forEach(item => {
            console.log('RichEditorController aboutToDelete spanIndex:' + item.spanPosition.spanIndex);
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          this.onDidChangeRangeBefore = JSON.stringify(rangeBefore);
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
          this.onDidRangeAfter = JSON.stringify(rangeAfter);
        })
        .id('rich_struct')

    }
  }
}