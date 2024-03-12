@Entry
@Component
struct RelativeChain5 {
  @State RelativeChain: ChainStyle = ChainStyle.PACKED
  @State RelativeChainAxis: Axis = Axis.Horizontal

  build() {
    Column() {
      // 链头链尾都设置chain
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow5_2", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow5_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow5_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow5_3", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow5_2")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow5_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow5_3")

      }
      .id('RelativeChain5')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow52_2", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow52_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow52_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow52_3", align: HorizontalAlign.Start}
          })
          .id("RelativeChainRow52_2")

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "RelativeChainRow52_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("RelativeChainRow52_3")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

      }
      .id('RelativeChain52')
      .width(400).height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)


    }
    .height('100%')
  }
}