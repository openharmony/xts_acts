// xxx.ets
@Entry
@Component
struct PanGesture2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State positionX: number = 0
  @State positionY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.All })

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + Math.round(this.offsetX) + 'Y:' + Math.round(this.offsetY)).key('Pan3')
        Text(String(Math.round(this.offsetX))).key('PanGesture2_1')
        Text(String(Math.round(this.offsetY))).key('PanGesture2_2')
      }
      .key('PanGesture2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({ x: this.offsetX, y: this.offsetY, z: 0 }) // 以组件左上角为坐标原点进行移动
      // 左右拖动触发该手势事件
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event?: GestureEvent) => {
            console.info('Pan start')
          })
          .onActionUpdate((event?: GestureEvent) => {
            if (event) {
              this.offsetX = this.positionX + event.offsetX
              this.offsetY = this.positionY + event.offsetY
            }
          })
          .onActionEnd(() => {
            this.positionX = this.offsetX
            this.positionY = this.offsetY
            console.info('Pan end')
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}