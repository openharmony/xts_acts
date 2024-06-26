@Entry
@Component
struct BlurType_BEHIND_WINDOW {
  @State message: string = 'Hello World';
  @State mBlurType: BlurType = BlurType.BEHIND_WINDOW

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('BEHIND_WINDOW')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, type: this.mBlurType })
      }
      .width('100%')
    }
    .height('100%')
  }
}