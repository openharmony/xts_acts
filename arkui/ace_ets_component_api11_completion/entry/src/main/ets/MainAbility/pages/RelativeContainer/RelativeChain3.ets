@Entry
@Component
struct RelativeChain3 {
  @State RelativeChain: ChainStyle = ChainStyle.PACKED
  @State RelativeChainAxis: Axis = Axis.Horizontal

  build() {
    Column() {
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow3_2", align: HorizontalAlign.Start},
            bias: { horizontal:0.3 }
          })
          .id("RelativeChainRow3_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow3_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow3_3", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow3_2")

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow3_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow3_3")
      }
      .id('RelativeChain3')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            bottom: {anchor: "RelativeChainRow32_2", align: VerticalAlign.Top},
            bias: { vertical:0.3 }
          })
          .id("RelativeChainRow32_1")
          .chainMode(Axis.Vertical, this.RelativeChain)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "RelativeChainRow32_1", align: VerticalAlign.Bottom},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            bottom: {anchor: "RelativeChainRow32_3", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow32_2")

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "RelativeChainRow32_2", align: VerticalAlign.Bottom},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            bottom: {anchor: "__container__", align: VerticalAlign.Bottom}
          })
          .id("RelativeChainRow32_3")
      }
      .id('RelativeChain32')
      .width(400).height(400)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)


    }
    .height('100%')
  }
}