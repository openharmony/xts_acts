@Entry
@Component
struct RelativeBarrier4 {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier4Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier4Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier4Bt1", align: VerticalAlign.Top },
            left: { anchor: "RelativeBarrier4Bt1", align: HorizontalAlign.Start }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrier4Bt3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "barrier1", align: HorizontalAlign.Start }
          })


      }
      .id('RelativeBarrier4')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier4Bt1", "RelativeBarrier4Bt2"]}
      ])
    }
    .height('100%')
  }
}