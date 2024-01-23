// xxx.ets
@Entry
@Component
struct OnTouch2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Touch3')
        Text(this.text).key('Touch4')
      }
      .key('OnTouch2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
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