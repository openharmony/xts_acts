@Entry
@Component
struct onSelectionChange8 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan("0123456789",
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 50
              }
            })

        })
        .onSelectionChange((event:RichEditorRange) => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange8_RichEditor')
        .width('100%')
        .height('20%')
      Text('' + this.text1).key("onSelectionChange8_text1")
      Text('' + this.text2).key("onSelectionChange8_text2")
      Text('' + this.text3).key("onSelectionChange8_text3")
      Button('setSelection:0').onClick(() => {
        this.controller.setSelection(-1, -1)
      }).id('onSelectionChange8_btn1')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}