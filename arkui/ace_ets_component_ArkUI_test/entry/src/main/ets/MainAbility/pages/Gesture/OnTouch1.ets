
@Entry
@Component
struct OnTouch1 {
  @State angle: number = 90
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Touch1')
        Text(this.text).key('Touch2')
      }
      .id('OnTouch1')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      .onTouch((event?: TouchEvent) => {
        if(event){
          this.text = String(Math.round(event.touches[0].x))
        }
      })
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
    .margin(100)
  }
}