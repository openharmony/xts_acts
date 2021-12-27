@Entry
@Component
struct navigator_testcase {
  @State active: boolean = false
  @State params: Object = { text: 'news' }

  build() {
    Column() {
      Navigator({ target: "pages/index", type: NavigationType.Back }) {
        Text('Navigator test  in Navigator，back')
      }.active(this.active)
      .key('navigator')
      .params({
        data: 24
      })

      Navigator({ target: "pages/index", type: NavigationType.Push }) {
        Text('Navigator test  in Navigator，push')
      }.active(this.active)
      .key('navigator2')
      .params({
        data: 24
      })

      Navigator({ target: "pages/index", type: NavigationType.Replace }) {
        Text('Navigator test  in Navigator，replace')
      }.active(this.active)
      .key('navigator3')
      .params({
        data: 24
      })
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
