@Entry
@Component
struct onSelectionChange4 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
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
        .id('onSelectionChange4_RichEditor')
        .width('100%')
        .height('30%')
      Text('' + this.text1).key("onSelectionChange4_text1")
      Text('' + this.text2).key("onSelectionChange4_text2")
      Text('' + this.text3).key("onSelectionChange4_text3")
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}