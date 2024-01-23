// xxx.ets
@Entry
@Component
struct LongPressGesture1 {
  @State angle: number = 90
  @State count: number = 0

  build() {
    Column() {
      Column() {
        Text('RotationGesture angle:' + this.angle).key('LongPress1')
        Text('LongPress onAction:' + this.count).key('LongPress2')
      }
      .key('LongPressGesture1')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
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
    .margin(100)
  }
}