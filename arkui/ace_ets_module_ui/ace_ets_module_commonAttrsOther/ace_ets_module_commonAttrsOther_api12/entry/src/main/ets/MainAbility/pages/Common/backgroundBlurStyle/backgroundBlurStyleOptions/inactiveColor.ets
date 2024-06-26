@Entry
@Component
struct backgroundBlurStyle_inactiveColorTest {
  @State message: string = 'Hello World';
  @State mInactiveColor: ResourceColor = '#21a1dd'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('inactiveColor')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.SYSTEM, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE, inactiveColor: this.mInactiveColor, type: BlurType.WITHIN_WINDOW })
      }
      .width('100%')
    }
    .height('100%')
  }
}