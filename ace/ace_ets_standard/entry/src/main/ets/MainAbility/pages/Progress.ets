@Entry
@Component
struct progress_testcase {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Progress page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Progress({ value: 20, total: 40, style: ProgressStyle.Linear })
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress')

        Progress({ value: 20, total: 40, style: ProgressStyle.Eclipse })
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress2')

      }
      .width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

