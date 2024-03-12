@Entry
@Component
struct RelativeBarrier2 {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier2Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier2Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier2Bt1", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeBarrier2Bt1", align: HorizontalAlign.Start }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrier2Bt3')
          .alignRules({
            top: { anchor: "barrier1", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })


      }
      .id('RelativeBarrier2')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.BOTTOM, referencedId:["RelativeBarrier2Bt1", "RelativeBarrier2Bt2"]}
      ])
    }
    .height('100%')
  }
}