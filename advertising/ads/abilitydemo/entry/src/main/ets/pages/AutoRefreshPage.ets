import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import systemDateTime from '@ohos.systemDateTime';
import Logger from '../log/HiAdLog';

const TAG = 'AutoRefreshAdPage';
const storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct AutoRefreshPage {
  @State message: string = 'AutoRefreshPage';
  @State currentTime: string = '';
  @LocalStorageLink('session') session: UIExtensionContentSession = void 0;

  aboutToAppear() {
    Logger.i(TAG, '%{public}s', 'aboutToAppear');
    this.session?.sendData({ status: 'onAdOpen', ad: {}, data: 'AdsTest' });

    this.session.setReceiveDataCallback((data)=> {
      Logger.i(TAG, `setReceiveDataCallback:${(JSON.stringify(data))}`);
      try {
        systemDateTime.getDate((error, date) => {
          if (error) {
            console.info(`Failed to get date. message: ${error.message}, code: ${error.code}`);
            return;
          }
          console.info(`Succeeded in getting date : ${date}`);;
          this.currentTime = this.currentTime + '\n' + date.toString();
        });
      } catch(e) {
        console.info(`Failed to get date. message: ${e.message}, code: ${e.code}`);
      }
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Text(this.currentTime)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
      }
      .backgroundColor(Color.Green)
      .width('100%')
    }
    .height('100%')
  }
}