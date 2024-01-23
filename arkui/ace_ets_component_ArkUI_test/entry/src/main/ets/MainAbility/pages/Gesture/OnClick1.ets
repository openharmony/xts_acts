// xxx.ets
@Entry
@Component
struct OnClick1 {
  @State angle: number = 90
  @State text: string = ''

  build() {
    Column() {
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Click1')
        Text(this.text).key('Click2')
      }
      .key('OnClick1')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      .onClick((event?: ClickEvent) => {
        if(event){
          this.text = String(Math.round(event.x))
        }
      })
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
    .margin(100)
  }
}