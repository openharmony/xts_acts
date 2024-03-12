@Entry
@Component
struct RelativeChain9 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: string = '100'
  @State RelativeHeight: string = '100'

  build() {
    Column() {
      // RelativeContainer 组件宽高自适应
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow9_2", align : HorizontalAlign.Start},
            center: {anchor: "__container__", align: VerticalAlign.Center}
          })
          .id("RelativeChainRow9_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeChainRow9_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow9_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeChainRow9_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow9_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeChainRow9_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeChainRow9_1", align: VerticalAlign.Top}
          })
          .id("RelativeChainRow9_3")
      }
      .id('RelativeChain9')
      .width('auto').height(200)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)

      Column() {
        RelativeContainer() {
          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FF3333")
            .alignRules({
              left: {anchor: "__container__", align: HorizontalAlign.Start},
              right: {anchor: "RelativeChainRow92_2", align : HorizontalAlign.Start},
              center: {anchor: "__container__", align: VerticalAlign.Center}
            })
            .id("RelativeChainRow92_1")
            .chainMode(Axis.Horizontal, this.RelativeChain)

          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FFCC00")
            .alignRules({
              left: {anchor: "RelativeChainRow92_1", align: HorizontalAlign.End},
              right: {anchor: "RelativeChainRow92_3", align : HorizontalAlign.Start},
              top: {anchor: "RelativeChainRow92_1", align: VerticalAlign.Top}
            })
            .id("RelativeChainRow92_2")

          Row().width(this.RelativeWidth).height(this.RelativeHeight)
            .backgroundColor("#FF6633")
            .alignRules({
              left: {anchor: "RelativeChainRow92_2", align: HorizontalAlign.End},
              right: {anchor: "__container__", align : HorizontalAlign.End},
              top: {anchor: "RelativeChainRow92_1", align: VerticalAlign.Top}
            })
            .id("RelativeChainRow92_3")
        }
        .id('RelativeChain92')
        .width(400).height('auto')
        .margin({left: 50, top: 50})
        .backgroundColor(Color.Grey)
      }.height(500)






    }
    .height('100%')
  }
}