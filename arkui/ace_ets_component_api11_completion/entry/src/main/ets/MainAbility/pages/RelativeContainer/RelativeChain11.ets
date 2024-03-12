@Entry
@Component
struct RelativeChain11 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: number = 100
  @State RelativeHeight: number = 100
  @State text: string = ''

  build() {
    Column() {
      // 三个子组件水平垂直方向都成链，只设置水平链
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            bottom: {anchor: "RelativeChainRow11_2", align : VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow11_2", align : HorizontalAlign.Start}
          })
          .id("RelativeChainRow11_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .onClick(() => {
            this.text = 'show'
          })


        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "RelativeChainRow11_1", align: VerticalAlign.Bottom},
            bottom: {anchor: "RelativeChainRow11_3", align : VerticalAlign.Top},
            left: {anchor: "RelativeChainRow11_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow11_3", align : HorizontalAlign.Start}
          })
          .id("RelativeChainRow11_2")
          .onClick(() => {
            this.text = 'show'
          })


        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "RelativeChainRow11_2", align: VerticalAlign.Bottom},
            bottom: {anchor: "__container__", align : VerticalAlign.Bottom},
            left: {anchor: "RelativeChainRow11_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End}
          })
          .id("RelativeChainRow11_3")
          .onClick(() => {
            this.text = 'show'
          })

      }
      .id('RelativeChain11')
      .width(400).height(100)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)
      Text(this.text).key('RelativeChain11Text')
      // 三个子组件水平垂直方向都成链
      RelativeContainer() {
        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            bottom: {anchor: "RelativeChainRow112_2", align : VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            right: {anchor: "RelativeChainRow112_2", align : HorizontalAlign.Start}
          })
          .id("RelativeChainRow112_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .chainMode(Axis.Vertical, this.RelativeChain)

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "RelativeChainRow112_1", align: VerticalAlign.Bottom},
            bottom: {anchor: "RelativeChainRow112_3", align : VerticalAlign.Top},
            left: {anchor: "RelativeChainRow112_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeChainRow112_3", align : HorizontalAlign.Start}
          })
          .id("RelativeChainRow112_2")

        Row().width(this.RelativeWidth).height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: {anchor: "RelativeChainRow112_2", align: VerticalAlign.Bottom},
            bottom: {anchor: "__container__", align : VerticalAlign.Bottom},
            left: {anchor: "RelativeChainRow112_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End}
          })
          .id("RelativeChainRow112_3")
      }
      .id('RelativeChain112')
      .width(400).height(400)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)


    }
    .height('100%')
  }
}