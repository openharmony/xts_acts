@Entry
@Component
struct RelativeChain6 {
  @State RelativeChain: ChainStyle = ChainStyle.PACKED
  @State RelativeChainAxis: Axis = Axis.Horizontal

  build() {
    Column() {
      // 水平链 设置bias
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow6_2", align: HorizontalAlign.Start},
            bias: { horizontal:0.3 }
          })
          .id("RelativeChainRow6_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow6_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow6_3", align: HorizontalAlign.Start},
            bias: { horizontal:0.8 }
          })
          .id("RelativeChainRow6_2")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow6_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow6_3")
      }
      .id('RelativeChain6')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow62_2", align: HorizontalAlign.Start},
            bias: { horizontal:0.3 }
          })
          .id("RelativeChainRow62_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow62_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow62_3", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow62_2")

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow62_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow62_3")
      }
      .id('RelativeChain62')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow63_2", align: HorizontalAlign.Start},
            bias: { horizontal:0.3 }
          })
          .id("RelativeChainRow63_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow63_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow63_3", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow63_2")

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow63_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow63_3")
      }
      .id('RelativeChain63')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

    }
    .height('100%')
  }
}