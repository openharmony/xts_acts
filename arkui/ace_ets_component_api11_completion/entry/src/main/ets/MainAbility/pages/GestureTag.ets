@Entry
@Component
struct TapGestureExample {
  @State value: string = ''

  build() {
    Column() {
      Text('Click twice').fontSize(28).key('TapGestureclick')
        .gesture(
          TapGesture({ count: 1 })
            .tag('TapGesture1')
            .onAction((event?: GestureEvent) => {
              if (event) {
                this.value = JSON.stringify(event.fingerList[0])
              }
            })
        )
      Text(this.value)
    }
    .height(200)
    .width(300)
    .padding(20)
    .border({ width: 3 })
    .margin(30)
  }
}