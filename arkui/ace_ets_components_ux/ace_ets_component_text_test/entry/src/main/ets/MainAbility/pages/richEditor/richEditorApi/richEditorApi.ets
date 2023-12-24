/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct richEditorApi {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private richEditorTextStyle: RichEditorTextStyle = {};
  @State selection:string = ''
  @State text1:string = '111'
  @Builder CustomCom(){
    Column(){
      Text('column').width('100%').height('100%')
    }.width(100).height(100)
  }

  build() {
    Scroll() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addBuilderSpan(() => {this.CustomCom()},{offset:0})
            this.controller.addTextSpan('Area1\n', {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 50
              },
              paragraphStyle: {
                textAlign: TextAlign.Start,
                leadingMargin: 16
              },
              gesture:
              {
                onClick: () => {
                  this.text1 = "text is onClick."
                },
                onLongPress: () => {
                  this.text1 = "text is onLongPress."
                }
              }
            })
            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: ["80px", "80px"],
                layoutStyle: {
                  borderRadius: '50px',
                  margin: '40px'
                }
              },
              gesture:
              {
                onClick: () => {
                  this.text1 = "ImageSpan is onClick."
                },
                onLongPress: () => {
                  this.text1 = "ImageSpan is onLongPress."
                }
              }
            })
            this.controller.setTypingStyle(
              {
                fontWeight: 'medium',
                fontColor: Color.Blue,
                fontSize: 50,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green }
              })
            this.richEditorTextStyle = this.controller.getTypingStyle()
            this.controller.setSelection(-1, -1)
            this.controller.getSelection()
            this.controller.getParagraphs({start:-1, end:-1})
            this.controller.updateParagraphStyle({start:-1, end:-1, style:{textAlign:TextAlign.Start, leadingMargin:'5vp'}})
          })
          .onPaste((event: PasteEvent) => {

          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height(400)
          .key('RichEditor1')
        Text('' + this.text1).key('richEditorApi_text1')

      }.borderWidth(1).borderColor(Color.Red)
    }
  }
}
