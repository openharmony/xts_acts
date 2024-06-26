@Entry
@Component
struct backgroundBlurStyle_policyTest {
  @State message: string = 'Hello World';
  @State mPolicy: BlurStyleActivePolicy = BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('policy')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.SYSTEM, policy: this.mPolicy, inactiveColor: Color.Red, type: BlurType.WITHIN_WINDOW })
      }
      .width('100%')
    }
    .height('100%')
  }
}