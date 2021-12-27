@Entry
@Component
struct counter {
  @State value: number = 0
  @State active: boolean = false
  private content: string = "Counter Page"

  onPageShow() {
    console.info('Counter page show called');
  }

  onBuildDone() {
    console.info('Counter page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Counter() {
        Text(this.value.toString())
      }.margin(100)
      .key('counter')
      .onInc(() => {
        this.value++
      })
      .onDec(() => {
        this.value--
      })
    }.width("100%")
    .key('flex')
    .width('100%')
    .height('100%')
  }
}
