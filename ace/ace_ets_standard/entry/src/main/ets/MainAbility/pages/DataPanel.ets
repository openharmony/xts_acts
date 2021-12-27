import router from '@system.router'

@Entry
@Component
struct dataPanel_testcase {
  @State width: string= "200"
  @State height: string= "100"
  @State active: boolean = false
  private content: string = "DataPanel Page"

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
      DataPanel({ values: [20, 40, 20], max: 100 })
        .width(this.width)
        .height(this.height)
        .key('DataPanel')
        .onClick(() => {
          router.back()
        })
        .closeEffect(false)

      DataPanel({ values: [20, 40, 20], max: 100 })
        .width(this.width)
        .height(this.height)
        .key('DataPanel2')
        .onClick(() => {
          router.back()
        })
        .closeEffect(true)
    }
    .key('flex')
    .width('100%')
    .height('100%')

  }
}
