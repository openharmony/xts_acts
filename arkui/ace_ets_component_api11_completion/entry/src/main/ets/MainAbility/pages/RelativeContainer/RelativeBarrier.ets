@Entry
@Component
struct RelativeBarrier {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(150)
          .width(100)
          .id('RelativeBarrierBt1')
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          })

        Button('B')
          .height(100)
          .width(100)
          .id('RelativeBarrierBt2')
          .alignRules({
            left: { anchor: "RelativeBarrierBt1", align: HorizontalAlign.End },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrierBt3')
          .alignRules({
            right: { anchor: "__container__", align: HorizontalAlign.End },
            bottom: { anchor: "barrier1", align: VerticalAlign.Top }
          })


      }
      .id('RelativeBarrier')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.TOP, referencedId:["RelativeBarrierBt1", "RelativeBarrierBt2"]}
      ])
    }
    .height('100%')
  }
}