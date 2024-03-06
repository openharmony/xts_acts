@Entry
@Component
struct onSelectionChange7 {
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
          this.controller.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ["57px", "57px"]
              }
            })
          this.controller.addSymbolSpan($r("sys.symbol.ohos_trash"),
            {
              style:
              {
                fontSize: 30
              }
            })
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
        .id('onSelectionChange7_RichEditor')
        .width('100%')
        .height('20%')
      Text('' + this.text1).key("onSelectionChange7_text1")
      Text('' + this.text2).key("onSelectionChange7_text2")
      Text('' + this.text3).key("onSelectionChange7_text3")
      Button('setCaretOffset:0').onClick(() => {
        this.controller.setCaretOffset(0)
      }).id('onSelectionChange7_btn1')
      Button('setCaretOffset:23').onClick(() => {
        this.controller.setCaretOffset(23)
      }).id('onSelectionChange7_btn2')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}