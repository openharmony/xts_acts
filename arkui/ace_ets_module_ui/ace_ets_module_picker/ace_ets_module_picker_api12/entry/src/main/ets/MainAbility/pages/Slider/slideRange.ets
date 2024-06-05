
@Entry
@Component
struct SliderExample {
  @State message: string = "Hello"

  build() {
    Row() {
      Column({ space: 8 }) {
        Text('同时设置from=20,to=80').fontSize(20).fontColor(0xCCCCCC).width('90%').margin(15)

        Row() {
          Slider({
            step: 10,
            style: SliderStyle.OutSet
          })
            .id("slideRangeValue")
            .showSteps(true)
            .slideRange({from:20, to:80})
        }
        .width('80%')

        Text(this.message).margin(20).id("getSlideRangeValue")

        Button("get slideRange").id("getInspectorByKey").onClick(() => {
          let strJson = getInspectorByKey('slideRangeValue');
          this.message = JSON.stringify(JSON.parse(strJson).$attrs.slideRange)
          console.info("[slideRange_001] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs.slideRange));
        })
      }.width('100%')
    }

  }
}