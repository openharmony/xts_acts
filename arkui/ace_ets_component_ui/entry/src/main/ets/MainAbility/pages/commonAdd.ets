@Entry
@Component
struct ForegroundBlurStyleDemo {
  build() {
    Column() {
      Text('Thin Material').fontSize(30).fontColor(0xCCCCCC)
      Image($r('app.media.icon'))
        .width(300)
        .height(350)
        .key('commonAdd')
        .foregroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
        .mouseResponseRegion(null)
        .background(null)
        .renderGroup(false)
        .renderFit(RenderFit.BOTTOM)
        .sphericalEffect(0.5)
        .lightUpEffect(0.6)
        .pixelStretchEffect({top:10,left:10,right:10,bottom:10 })
        .reuseId(null)

    }
    .height('100%')
    .width('100%')
    .width('100%')
    .accessibilityGroup(true)
    .accessibilityLevel("yes")
    .accessibilityText("分组")
    .accessibilityDescription("Column组件可以被选中，播报的内容是“分组”")
  }
}