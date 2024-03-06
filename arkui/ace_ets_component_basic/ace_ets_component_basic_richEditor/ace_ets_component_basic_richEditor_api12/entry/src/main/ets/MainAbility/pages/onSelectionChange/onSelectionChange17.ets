@Entry
@Component
struct onSelectionChange17 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan("012",
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 50
              }
            })
          this.controller.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Center,
            }
          })

        })
        .onSelectionChange((event:RichEditorRange) => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange17_RichEditor')
        .width('100%')
        .height('20%')
      Text('' + this.text1).key("onSelectionChange17_text1")
      Text('' + this.text2).key("onSelectionChange17_text2")
      Text('' + this.text3).key("onSelectionChange17_text3")
      Button("setCaretOffset:").onClick(() => {
        this.controller.setCaretOffset(3)
      }).id('onSelectionChange17_btn1')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}