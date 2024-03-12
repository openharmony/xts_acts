@Entry
@Component
struct RelativeBorder {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativePad: number = 0

  build() {
    Column() {
      RelativeContainer() {
        Row().width(50).height(50)
          .backgroundColor("#FF3333")
          .alignRules({
            left: {anchor: "guideLine1", align: HorizontalAlign.Start},
            right: {anchor: "RelativeBorderRow_2", align : HorizontalAlign.Start}
          })
          .id("RelativeBorderRow_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row().width(50).height(50)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "RelativeBorderRow_1", align: HorizontalAlign.End},
            right: {anchor: "RelativeBorderRow_3", align : HorizontalAlign.Start},
            top: {anchor: "RelativeBorderRow_1", align: VerticalAlign.Top}
          })
          .id("RelativeBorderRow_2")

        Row().width(50).height(50)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "RelativeBorderRow_2", align: HorizontalAlign.End},
            right: {anchor: "__container__", align : HorizontalAlign.End},
            top: {anchor: "RelativeBorderRow_1", align: VerticalAlign.Top}
          })
          .id("RelativeBorderRow_3")
      }
      .id('RelativeBorder')
      .width(400).height(400)
      .margin({left: 50, top: 50})
      .backgroundColor(Color.Grey)
      .borderWidth({ top: this.RelativePad })
      .guideLine([
        {id:"guideLine1", direction: Axis.Vertical, position: { start: 50 }}
      ])

      Button('borderWidth 50').onClick((event: ClickEvent) => {
        this.RelativePad = 50
      }).key('addBorderWidth')

    }
    .height('100%')
  }
}
