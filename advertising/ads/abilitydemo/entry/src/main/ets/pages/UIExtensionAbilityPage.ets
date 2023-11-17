import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import Logger from '../log/HiAdLog';

const TAG = 'AdPage';
const storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct UIExtensionAbilityPage {
  @State message: string = 'UIExtensionAbilityPage';
  @LocalStorageLink('session') session: UIExtensionContentSession = void 0;

  aboutToAppear() {
    Logger.i(TAG, '%{public}s', 'aboutToAppear');
    this.session?.sendData({ status: 'onAdOpen', ad: {}, data: 'AdsTest' });
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .backgroundColor(Color.Green)
      .width('100%')
    }
    .height('100%')
  }
}