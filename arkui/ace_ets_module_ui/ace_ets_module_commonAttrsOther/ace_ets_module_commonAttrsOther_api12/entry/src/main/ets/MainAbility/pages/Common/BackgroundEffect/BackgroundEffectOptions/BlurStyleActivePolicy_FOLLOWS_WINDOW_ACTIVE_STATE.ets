@Entry
@Component
struct BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE {
  @State message: string = 'Hello World';
  @State mBlurStyleActivePolicy: BlurStyleActivePolicy = BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('FOLLOWS_WINDOW_ACTIVE_STATE')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, policy: this.mBlurStyleActivePolicy })
      }
      .width('100%')
    }
    .height('100%')
  }
}