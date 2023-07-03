/*
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
struct TextAreaSelect {
  controller: TextAreaController = new TextAreaController()
  controller2: TextAreaController = new TextAreaController()
  controller3: TextAreaController = new TextAreaController()
  @State text: string = '123456'

  build() {
    Column() {
      TextArea({ text: this.text, placeholder: 'input your word', controller: this.controller })
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(1)
        .key('TextAreaSelect_TextArea_1')
      Button("Show selected (-2,-1)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(-2,-1)
        })
        .key('TextAreaSelect_Button_1')
      Button("Show selected (-1,0)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(-1,0)
        })
        .key('TextAreaSelect_Button_2')
      Button("Show selected (0,3)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(0,3)
        })
        .key('TextAreaSelect_Button_3')
      Button("Show selected (1,3)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(1,3)
        })
        .key('TextAreaSelect_Button_4')
      Button("Show selected (-1,6)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(-1,6)
        })
        .key('TextAreaSelect_Button_5')
      Button("Show selected (0,6)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(0,6)
        })
        .key('TextAreaSelect_Button_6')
      Button("Show selected (-1,8)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(-1,8)
        })
        .key('TextAreaSelect_Button_7')
      Button("Show selected (0,8)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(0,8)
        })
        .key('TextAreaSelect_Button_8')
      Button("Show selected (null,null)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(null,null)
        })
        .key('TextAreaSelect_Button_9')
      Button("Show selected (null,undefined)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(null,undefined)
        })
        .key('TextAreaSelect_Button_10')
      Button("Show selected (undefined,null)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(undefined,null)
        })
        .key('TextAreaSelect_Button_11')
      Button("Show selected (undefined,undefined)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(undefined,undefined)
        })
        .key('TextAreaSelect_Button_12')
      TextArea({ text: '', placeholder: 'input your word', controller: this.controller2 })
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(2)
        .key('TextAreaSelect_TextArea_2')
      Button("Show selected (1,3)")
        .margin(30)
        .onClick(() => {
          this.controller2.setTextSelection(1,3)
        })
        .key('TextAreaSelect_Button_13')
      TextArea({ text: '北京aaaaa上海tianjin深圳', placeholder: 'input your word', controller: this.controller3 })
        .width(200)
        .height(50)
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(3)
        .key('TextAreaSelect_TextArea_3')
      Button("Show selected (6,10)")
        .margin(30)
        .onClick(() => {
          this.controller3.setTextSelection(6,10)
        })
        .key('TextAreaSelect_Button_14')
    }
  }
}