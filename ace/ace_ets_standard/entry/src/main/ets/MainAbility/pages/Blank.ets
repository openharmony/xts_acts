@Entry
@Component
struct blank_testcase {
  @State Color: Color = Color.Pink
  @State active: boolean = false
  private content: string = "Blank Page"

  onPageShow() {
    console.info('Blank page show called');
  }

  onBuildDone() {
    console.info('Blank page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Blank(100)
        .color(this.Color)
        .key('blank')
      Text('on/off').fontSize(18).height(60)
    }
    .key('flex')
    .width('100%')
    .height('100%')


  }
}
