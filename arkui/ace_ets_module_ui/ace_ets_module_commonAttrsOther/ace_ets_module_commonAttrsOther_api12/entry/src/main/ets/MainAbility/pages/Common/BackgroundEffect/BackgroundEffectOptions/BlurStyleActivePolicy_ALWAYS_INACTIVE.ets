@Entry
@Component
struct BlurStyleActivePolicy_ALWAYS_INACTIVE {
  @State message: string = 'Hello World';
  @State mBlurStyleActivePolicy: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_INACTIVE

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('ALWAYS_INACTIVE')
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