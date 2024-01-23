// xxx.ets
@Entry
@Component
struct SwipeGesture1 {
  @State angle: number = 90
  @State rotateAngle: number  = 0
  @State speed: number = 1

  build() {
    Column() {
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Swipe1')
        Text(String(Math.round(this.rotateAngle))).key('Swipe2')
      }
      .key('SwipeGesture1')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      // 单指竖直方向滑动时触发该事件
      .gesture(
        SwipeGesture({ direction: SwipeDirection.All })
          .onAction((event?: GestureEvent) => {
            if (event) {
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