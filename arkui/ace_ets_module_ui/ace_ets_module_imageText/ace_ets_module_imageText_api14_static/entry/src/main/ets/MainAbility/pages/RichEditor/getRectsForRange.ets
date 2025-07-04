import { Entry, Component, Column, RichEditor, Button, TextAlign, BorderOptions, Color, FontWeight, LayoutManager, ClickEvent, RichEditorController,RichEditorOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct getRectsForRange {
  controller: RichEditorController = new RichEditorController();
  @State str: string = ''
  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady(():void => {
          this.controller.addTextSpan("1234567890", {
            style: {
              fontColor: Color.Pink,
              fontSize: "30vp",
              fontWeight: FontWeight.Normal,
              letterSpacing: '20vp'
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 20
            }
          })
        })
        .width("100%")
        .height("20%")
        .border({ width: 1, radius: 5 } as BorderOptions)
        .draggable(false)

      Button(this.str)
        .key("getRectsForRange_Key")
        .onClick((e:ClickEvent) => {
          // let layoutManager: LayoutManager = this.controller.getLayoutManager()
          // if(layoutManager){
          //   let boxes = layoutManager.getRectsForRange({start:0,end:4}, 0, 0)
          //   if (boxes) {
          //     this.str = "getRectsForRange successful"
          //   }
          // }
        })
    }
  }
}