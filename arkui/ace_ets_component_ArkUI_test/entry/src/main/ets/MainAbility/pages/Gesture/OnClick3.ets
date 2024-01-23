// xxx.ets
@Entry
@Component
struct OnClick3 {
  @State scaleX: number = 1.8
  @State scaleY: number = 2.2
  @State text: string = ''

  build() {
    Column() {
      Column() {
        Text('PinchGesture center:(' + this.scaleX + ',' + this.scaleY + ')').key('Click5')
        Text(this.text).key('Click6')
      }
      .key('OnClick3')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .scale({ x: this.scaleX, y: this.scaleY, z: 1 })
      .onClick((event?: ClickEvent) => {
        if(event){
          this.text = String(Math.round(event.x))
        }
      })
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}