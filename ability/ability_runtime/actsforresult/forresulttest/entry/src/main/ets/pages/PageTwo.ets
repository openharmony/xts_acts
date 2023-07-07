@Entry
@Component
struct PageTwo {
  @State message: string = 'Second application'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('TerminateCallback0100')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            globalThis.StartAbilityForResult_CallBack()
          })
          .margin({
            top: 5
          })
        Button('TerminatePromise0100')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            globalThis.StartAbilityForResult_Promise()
          })
          .margin({
            top: 5
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}