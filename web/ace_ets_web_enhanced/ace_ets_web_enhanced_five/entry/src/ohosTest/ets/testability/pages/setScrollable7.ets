import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Button('setScrollable')
        .key('001')
        .onClick(() => {
          try {
            this.controller1.setScrollable(true, webview.ScrollType.EVENT);
          } catch (error) {
            console.log('mqf')
            console.error(`ErrorCode: ${(error as BusinessError).code}, ErrorMessage: ${(error as BusinessError).message}`);
            LocalContext.context.eventHub.emit('testSetScrollableTest0600', (error as BusinessError).code)
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}
