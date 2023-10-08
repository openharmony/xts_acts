import { Font } from '@ohos.arkui.UIContext'
@Entry
@Component
struct UiPage {
  @State message: string = 'SingleServiceExtension2'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontStyle(FontStyle.Italic)

        Button() {
          Text('get app state')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          globalThis.GetApplicationState();
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}