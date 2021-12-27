@Entry
@Component
struct column {
  @State active: boolean = false
  private content: string = "Column Page"

  onPageShow() {
    console.info('Column page show called');
  }

  onBuildDone() {
    console.info('Column page build done called');
  }

  build() {
    Column({ space: 5 }) {
      Text('alignItems(Center)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Column() {
        Column().width('50%').height(50).backgroundColor(0xAFEEEE)
        Column().width('50%').height(50).backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.Center).width('90%').border({ width: 1 }).key('column')

      Text('alignItems(Start)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Column() {
        Column().width('50%').height(50).backgroundColor(0xAFEEEE)
        Column().width('50%').height(50).backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.Start).width('90%').border({ width: 1 }).key('column1')

      Text('alignItems(End)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Column() {
        Column().width('50%').height(50).backgroundColor(0xAFEEEE)
        Column().width('50%').height(50).backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.End).width('90%').border({ width: 1 }).key('column2')
    }.width('100%').padding({ top: 5 })
  }
}
