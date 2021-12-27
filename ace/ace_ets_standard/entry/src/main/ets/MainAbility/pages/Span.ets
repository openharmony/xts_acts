@Entry
@Component
struct span_textcase {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text() {
          Span('Test Span demo')
            .decoration({ type: TextDecorationType.LineThrough, "color": Color.Red })
            .textCase(TextCase.UpperCase)
            .fontColor(Color.Blue)
            .fontSize("20fp")
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Italic)
            .key('span1')
          Span('The second test Span demo')
            .textCase(TextCase.LowerCase)
            .fontColor(Color.Black)
            .fontSize("30fp")
            .key('span2')
          Span('The third test Span demo')
            .textCase(TextCase.Normal)
            .fontColor(Color.Yellow)
            .fontSize("30fp")
            .key('span3')
        }
      }
      .width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(4)
    }
  }
}



