@Entry
@Component
struct listItem_testcase {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State editFlag: boolean = false
  @State active: boolean = false

  build() {
    Column() {
      Column() {
        List() {
          ListItem() {
            Text('sticky:Normal , item1111')
              .width('100%')
              .height(40)
              .fontSize(12)
          }.sticky(Sticky.Normal)
          .editable(true)
          .key('listitem')

          ListItem() {
            Text('sticky:Opacity , item3333')
              .width('100%')
              .height(40)
              .fontSize(12)
          }.sticky(Sticky.Opacity)
          .editable(true)
          .key('listitem3')
        }
      }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}

