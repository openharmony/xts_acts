@Entry
@Component
struct InvertOptionsenum {
  build() {
    Column({ space: 100 }) {
      Text('InvertOptionsenum')
        .backgroundColor(Color.Blue)
        .key('InvertOptionsenum')
        .invert({
          low:1,
          high:1,
          threshold:1,
          thresholdRange:1
        })
    }.width('100%').backgroundColor(Color.Green)
  }
}