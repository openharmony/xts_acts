import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Button('setScrollable_false')
        .key('001')
        .onClick(() => {
          try {
            this.controller.setScrollable(false);
            setTimeout(() => {
              this.controller.setScrollable(true);
            }, 1000)
            LocalContext.context.eventHub.emit('testSetScrollableTest0500', 1)
          } catch (error) {
            console.error(`setScrollable_false ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}