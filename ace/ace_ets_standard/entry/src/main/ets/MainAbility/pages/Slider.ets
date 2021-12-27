@Entry
@Component
struct slider {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Slider page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Slider({
          value: 40,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .blockColor('#FFFF0000')
          .selectedColor('#FF0000FF')
          .trackColor('#FF808080')
          .showTips(false)
          .showSteps(false)
          .width("200")
          .height("100")
          .key('slider1')
        Slider({
          value: 40,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        })
          .blockColor(Color.Red)
          .selectedColor(Color.Blue)
          .trackColor(Color.Gray)
          .showTips(true)
          .showSteps(true)
          .key('slider2')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

