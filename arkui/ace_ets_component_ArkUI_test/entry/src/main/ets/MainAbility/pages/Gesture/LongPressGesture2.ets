// xxx.ets
@Entry
@Component
struct LongPressGesture2 {
  @State offsetX: number = 20
  @State offsetY: number = 10
  @State count: number = 0

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('LongPress3')
        Text('LongPress onAction:' + this.count).key('LongPress4')
      }
      .key('LongPressGesture2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
      .gesture(
        LongPressGesture({ repeat: true })
          // 由于repeat设置为true，长按动作存在时会连续触发，触发间隔为duration（默认值500ms）
          .onAction((event?: GestureEvent) => {
            if (event && event.repeat) {
              this.count = 2
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}