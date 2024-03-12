@Entry
@Component
struct RelativeBarrier3 {
  //
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier3Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier3Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier3Bt1", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrier3Bt3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "barrier1", align: HorizontalAlign.Start }
          })


      }
      .id('RelativeBarrier3')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.LEFT, referencedId:["RelativeBarrier3Bt1", "RelativeBarrier3Bt2"]}
      ])
    }
    .height('100%')
  }
}