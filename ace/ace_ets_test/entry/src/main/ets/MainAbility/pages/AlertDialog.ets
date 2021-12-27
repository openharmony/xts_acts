@Entry
@Component
struct alertdialog {
  @State currentTest: string  = 'default'

  build() {
    Column() {
      Text(`${this.currentTest}`)
        .fontSize(20)

      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          AlertDialog.show({
            title: 'Title',
            message: 'This is message',
            primaryButton: {
              value: '11111111111',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          })
            .key('alertDialog')
        })
    }
    .width('100%')
    .height('100%')
  }
}