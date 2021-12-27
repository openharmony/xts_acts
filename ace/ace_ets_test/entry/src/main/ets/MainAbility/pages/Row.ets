@Entry
@Component
struct row_testcase {
  @State alignItems: VerticalAlign= VerticalAlign.Top
  @State active: boolean = false

  build() {
    Column() {
      Navigator({ target: "pages/index", type: NavigationType.Back }) {
        Row() {
          Column() {
            Text("Row-Demo1")
          }

          Column() {
            Text("Demo2")
          }
        }
        .key('row')
        .alignItems(this.alignItems)

      }.active(this.active)
      .params({
        data: 26
      })
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}

