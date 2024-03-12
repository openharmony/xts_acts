@Entry
@Component
struct RelativeBarrier8 {
  @State isShow: boolean = false

  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier8Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier8Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier8Bt1", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeBarrier8Bt1", align: HorizontalAlign.Start }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrier8Bt3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "barrier1", align: HorizontalAlign.Start }
          })


      }
      .id('RelativeBarrier8')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier8Bt1", "RelativeBarrier8Bt6"]}
      ])


    }
    .height('100%')
  }
}