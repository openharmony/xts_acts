// xxx.ets
@Entry
@Component
struct SwipeGesture3 {
  @State scaleX: number = 0.5
  @State scaleY: number = 0.5
  @State rotateAngle: number = 0
  @State speed: number = 1

  build() {
    Column() {
      Column() {
        Text('PinchGesture center:(' + this.scaleX + ',' + this.scaleY + ')').key('Swipe5')
        Text(String(Math.round(this.rotateAngle))).key('Swipe6')
      }
      .key('SwipeGesture3')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .scale({ x: this.scaleX, y: this.scaleY, z: 1 })
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