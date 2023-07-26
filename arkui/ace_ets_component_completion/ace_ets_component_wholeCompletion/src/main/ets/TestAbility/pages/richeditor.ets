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
struct RichEditorExample {
  @State text1: string = '';
  @State text2: string = '';
  @State current: number = 5
  @State Richdelete: Boolean = false;
  controller1:RichEditorController = new RichEditorController();
  controller: RichEditorController = new RichEditorController()
  build() {
    Column() {
      Column(){
        Flex({wrap: FlexWrap.Wrap}){
          Button('添加文本')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .fontColor(Color.White)
            .width(90)
            .margin({bottom: 5,right:5})
            .onClick(() => {
              this.controller.addTextSpan("实例文字", {
                offset: 0,
                style: {
                  fontColor: Color.Red,
                  fontSize: 8,
                  fontStyle: FontStyle.Italic,
                  fontWeight: FontWeight.Lighter,
                  fontFamily: "sans-serif",
                  decoration: { type: TextDecorationType.None, color: Color.Brown }
                }
              })
            })
            .key("addSpan")
          Button('添加图片')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .fontColor(Color.White)
            .width(90)
            .margin({bottom: 5,right:5})
            .onClick(() => {
              this.controller.addImageSpan($r('app.media.icon'), {
                offset: 0,
                imageStyle: {
                  size: ["114px", "114px"],
                  verticalAlign: ImageSpanAlignment.CENTER,
                  objectFit: ImageFit.Cover
                }
              })
            })
          Button('修改样式')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .fontColor(Color.White)
            .width(90)
            .margin({bottom: 5,right:5})
            .onClick(() => {
              this.controller.updateSpanStyle({
                textStyle: {
                  fontColor:Color.Blue,
                  fontSize:12,
                  fontStyle:FontStyle.Italic,
                  fontWeight:FontWeight.Bolder,
                  fontFamily:"sans-serif",
                  decoration: { type: TextDecorationType.Underline, color: Color.Red }
                }
              })
            })
          Button('删除')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .fontColor(Color.White)
            .width(90)
            .margin({bottom: 5,right:5})
            .onClick(() => {
              this.controller.deleteSpans({
                start: 22,
                end: 25
              })
            })
          Button('getSpans')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .fontColor(Color.White)
            .width(90)
            .margin({bottom: 5,right:5})
            .onClick(() => {
              let range: RichEditorRange = { start: 0, end: 5, };
              let value = this.controller.getSpans(range)
              console.log("11111111"+ value)
            })
        }


      }.width('100%').height('20%').borderWidth(2).borderStyle(BorderStyle.Solid).padding(5)

      Column() {
        RichEditor({ controller: this.controller })
          .aboutToIMEInput((RichEditorInsertValue) => {
            console.log("wxh test app aboutToIMEInput")
            return true
          })
          .onIMEInputComplete((RichEditorTextSpanResult) => {
            console.log("wxh test app onIMEInputComplete")
          })
          .aboutToDelete((RichEditorDeleteValue) => {
            console.log("wxh test app aboutToDelete")
            return true
          })
          .onDeleteComplete(() => {
            let DeleteValue: RichEditorDeleteValue = { offset:10,direction:(RichEditorDeleteDirection.BACKWARD),length:10,richEditorDeleteSpans:(null)}
            let DeleteValue1: RichEditorDeleteValue = { offset:10,direction:(RichEditorDeleteDirection.FORWARD),length:10,richEditorDeleteSpans:(null)}
            this.Richdelete = true;
            console.log("wxh test app onDeleteComplete")
          }).key('Stage_RichEditor_Test_2100')
          .onReady(() => {
            for (let i = 0; i < 10; i++) {
              this.controller.addTextSpan("实例文字", {
                offset: 6,
                style: {
                  fontColor: Color.Black,
                  fontSize: "30",
                  fontStyle: FontStyle.Italic,
                  fontWeight: FontWeight.Bolder,
                  fontFamily: "sans-serif",
                  decoration: { type: TextDecorationType.Underline, color: Color.Red }
                }
              })

              this.controller.addImageSpan($r('app.media.icon'), {
                offset: 0,
                imageStyle: {
                  size: ["114fp", "114fp"],
                }
              })
            }
          })
          .borderWidth(1).borderColor(Color.Green)
      }

      Column(){
        RichEditor({ controller: this.controller })
          .onReady(() => {
            this.controller.addTextSpan("我是一段文字1", {
              style: {
                fontColor: Color.Black,
              }
            })
            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: ["50fp", "50fp"],
                objectFit: ImageFit.Auto
              }
            })
            this.controller.addTextSpan("我是一段文字2", {
              style: {
                fontColor: Color.Black,
              }
            })
          })
      }.width('100%').height('80%').borderWidth(2).borderStyle(BorderStyle.Solid).padding(5)
    }.width('100%').height("100%").padding(10)
  }
}