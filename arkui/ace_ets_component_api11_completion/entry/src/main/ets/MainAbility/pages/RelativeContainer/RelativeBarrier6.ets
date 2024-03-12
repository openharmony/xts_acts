@Entry
@Component
struct RelativeBarrier6 {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier6Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier6Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier6Bt1", align: VerticalAlign.Top },
            left: { anchor: "RelativeBarrier6Bt1", align: HorizontalAlign.Start }
          })

        Button('C')
          .height(200)
          .width(100)
          .id('RelativeBarrier6Bt3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "barrier1", align: HorizontalAlign.Start }
          })


      }
      .id('RelativeBarrier6')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:[]}
      ])
    }
    .height('100%')
  }
}