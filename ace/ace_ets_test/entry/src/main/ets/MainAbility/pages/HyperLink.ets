@Entry
@Component
struct hyperLink_testcase {
  @State active: boolean = false

  build() {
    Column() {
      Column() {
        Hyperlink('https://developer.harmonyos.com/', 'Go to the developer website') {
          Text("click to link to developer page")
            .fontSize(30)
        }.color("#008000")
        .key('hyperlink1')
      }.width('100%').margin({ top: 5 })
    }
    .width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
