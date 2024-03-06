@Entry
@Component
struct onSelectionChange6 {
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
                fontSize: 30
              }
            })
        })
        .onSelectionChange((event:RichEditorRange) => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange6_RichEditor')
        .width('100%')
        .height('20%')
      Text('' + this.text1).key("onSelectionChange6_text1")

      Button('setCaretOffset:-1').onClick(() => {
        this.controller.setCaretOffset(-1)
      }).id('onSelectionChange6_btn1')
      Button('setCaretOffset:0').onClick(() => {
        this.controller.setCaretOffset(0)
      }).id('onSelectionChange6_btn2')
      Button('setCaretOffset:1').onClick(() => {
        this.controller.setCaretOffset(1)
      }).id('onSelectionChange6_btn3')
      Button('setCaretOffset:5').onClick(() => {
        this.controller.setCaretOffset(5)
      }).id('onSelectionChange6_btn4')
      Button('setCaretOffset:10000').onClick(() => {
        this.controller.setCaretOffset(10000)
      }).id('onSelectionChange6_btn5')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}