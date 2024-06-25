@Entry
@Component
struct BlurType_WITHIN_WINDOW {
  @State message: string = 'Hello World';
  @State mBlurType: BlurType = BlurType.WITHIN_WINDOW

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('WITHIN_WINDOW')
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