@Entry
@Component
struct inactiveColorTest {
  @State message: string = 'Hello World';
  @State mInactiveColor: ResourceColor = '#21a1dd'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('bgde_inactiveColor')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE, inactiveColor: this.mInactiveColor })
      }
      .width('100%')
    }
    .height('100%')
  }
}