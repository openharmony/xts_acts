// xxx.ets
@Entry
@Component
struct OnClick2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State text: string = ''

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Click3')
        Text(this.text).key('Click4')
      }
      .key('OnClick2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
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