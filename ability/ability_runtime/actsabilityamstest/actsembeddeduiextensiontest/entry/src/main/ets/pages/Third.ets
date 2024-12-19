import { router } from '@kit.ArkUI';

@Entry
@Component
struct Third {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('ThirdHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          router.pushUrl({
            url: '@bundle:com.example.act_embeddeduiextension/entry_test/testability/pages/Third'
          })
        })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}