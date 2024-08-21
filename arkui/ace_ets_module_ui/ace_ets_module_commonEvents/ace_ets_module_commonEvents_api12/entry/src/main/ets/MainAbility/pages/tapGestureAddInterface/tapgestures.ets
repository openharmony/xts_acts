@Entry
@Component
struct TapGestureExample {
  @State value: string = ''
  @State count: number = 2;
  @State fingers: number = 1
  @State distanceThreshold: number = 100;

  build() {
    Column() {
      // 单指双击文本触发手势事件
      Column() {
        Text('Click twice ').fontSize(28)
      }.backgroundColor(Color.Green).width(200).height(150).gesture(
        TapGesture({distanceThreshold : this.distanceThreshold,fingers:this.fingers})
          .onAction((event: GestureEvent) => {
            if (event) {
              this.value = JSON.stringify(event.fingerList[0])
            }
          })
      ).key("interfaceTestKey")
      Text(this.value).key("valueKey")
    }
    .height(200)
    .width(300)
    .padding(20)
    .border({ width: 3 })
    .margin(30)
  }
}