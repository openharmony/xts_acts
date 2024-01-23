// xxx.ets
@Entry
@Component
struct SwipeGesture2 {
  @State offsetX: number = 20
  @State offsetY: number = 10
  @State rotateAngle: number = 0
  @State speed: number = 1

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Swipe3')
        Text(String(Math.round(this.rotateAngle))).key('Swipe4')
      }
      .key('SwipeGesture2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
      // 单指竖直方向滑动时触发该事件
      .gesture(
        SwipeGesture({ direction: SwipeDirection.All })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.speed = event.speed
              this.rotateAngle = event.angle
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}