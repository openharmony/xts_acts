// xxx.ets
@Entry
@Component
struct TapGesture3 {
  @State scaleX: number = 1.5
  @State scaleY: number = 1.5
  @State value: string = ''

  build() {
    Column() {
      Column() {
        Text('PinchGesture center:(' + this.scaleX + ',' + this.scaleY + ')').key('Tap5')
        Text(this.value).key('Tap6')
      }
      .key('TapGesture3')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .scale({ x: this.scaleX, y: this.scaleY, z: 1 })
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
  }
}