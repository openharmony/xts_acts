// xxx.ets
@Entry
@Component
struct TapGesture2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State value: string = ''

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Tap3')
        Text(this.value).key('Tap4')
      }
      .key('TapGesture2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.value = 'TapGesture'
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}