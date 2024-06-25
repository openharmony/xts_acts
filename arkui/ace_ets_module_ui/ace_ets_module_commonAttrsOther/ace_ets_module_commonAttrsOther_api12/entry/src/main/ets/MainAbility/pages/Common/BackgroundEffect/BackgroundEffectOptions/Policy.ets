@Entry
@Component
struct policyTest {
  @State message: string = 'Hello World';
  @State mPolicy: BlurStyleActivePolicy = BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('bgde_policy')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, policy: this.mPolicy, inactiveColor: Color.Green })
      }
      .width('100%')
    }
    .height('100%')
  }
}