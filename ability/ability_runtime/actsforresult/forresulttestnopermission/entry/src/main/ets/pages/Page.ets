import Want from '@ohos.app.ability.Want';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';

let storage = LocalStorage.GetShared()

@Entry(storage)
@Component
struct Page {
  @State message: string = 'UIExtAbility'
  private session: UIExtensionContentSession = storage.get<UIExtensionContentSession>('session');

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}