import Want from '@ohos.app.ability.Want';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession'
import common from '@ohos.app.ability.common';
let context = getContext(this) as common.UIExtensionContext;


let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Index {
  @State message: string = 'UIExtAbility has been started'
  private session = storage.get<UIExtensionContentSession>('session');

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontStyle(FontStyle.Italic)

        Button("TerminateSelf")
          .type(ButtonType.Capsule)
          .margin({top: 30})
          .backgroundColor('#87CEEB')
          .width('70%')
          .height('6%')
          .onClick(() => {
            this.session.terminateSelf((err) => {
              console.info("Terminate service extension: " + JSON.stringify(err));
            })
            storage.clear();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}