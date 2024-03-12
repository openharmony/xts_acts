@Entry
@Component
struct RelativeBarrier5 {
  @State isShow: boolean = false

  @State RelativeHeight: number = 100
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier5Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier5Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier5Bt1", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })

        if (this.isShow) {
          Button('C')
            .height(this.RelativeHeight)
            .width(100)
            .id('RelativeBarrier5Bt3')
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              left: { anchor: "barrier1", align: HorizontalAlign.Start }
            })
        }

      }
      .id('RelativeBarrier5')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier5Bt1", "RelativeBarrier5Bt2"]},
        {id: "barrier2", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier5Bt1", "RelativeBarrier5Bt2", "RelativeBarrier5Bt3"]}
      ])

      Button('增加子组件').onClick(() => {
        this.isShow = true
      }).key('addChild')

    }
    .height('100%')
  }
}