@Entry
@Component
struct grid_testcase {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  @State active: boolean = false

  build() {
    Column() {
      Navigator({ target: "pages/index", type: NavigationType.Back }) {
        Column({ space: 5 }) {
          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, day => day)
            }, day => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height(300)
          .key('Grid')
        }.width('100%').margin({ top: 5 })
      }.active(this.active)
      .params({
        data: 19
      })
    }.width(300)
    .height(350)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}