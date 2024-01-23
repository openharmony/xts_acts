// xxx.ets
@Entry
@Component
struct TapGesture1 {
  @State angle: number = 90
  @State rotateValue: number = 0
  @State value: string = ''

  build() {
    Column(){
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Tap1')
        Text(this.value).key('Tap2')
      }
      .key('TapGesture1')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.value = 'TapGesture'
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
    .margin(100)
  }
}