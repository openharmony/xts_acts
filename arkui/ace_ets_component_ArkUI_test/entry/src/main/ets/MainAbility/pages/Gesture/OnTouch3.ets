// xxx.ets
@Entry
@Component
struct OnTouch3 {
  @State scaleX: number = 1.8
  @State scaleY: number = 2.2
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Column() {
        Text('PinchGesture center:(' + this.scaleX + ',' + this.scaleY + ')').key('Touch5')
        Text(this.text).key('Touch6')
      }
      .key('OnTouch3')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .scale({ x: this.scaleX, y: this.scaleY, z: 1 })
      .onTouch((event?: TouchEvent) => {
        if(event){
          this.text = String(Math.round(event.touches[0].x))
        }
      })
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}