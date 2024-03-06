@Entry
@Component
struct onSelectionChange5 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {

          this.controller.addTextSpan("0",
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
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
        })
        .onSelectionChange((event:RichEditorRange) => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange5_RichEditor')
        .width('100%')
        .height('30%')
      Text('' + this.text1).key("onSelectionChange5_text1")
      Text('' + this.text2).key("onSelectionChange5_text2")
      Text('' + this.text3).key("onSelectionChange5_text3")
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}