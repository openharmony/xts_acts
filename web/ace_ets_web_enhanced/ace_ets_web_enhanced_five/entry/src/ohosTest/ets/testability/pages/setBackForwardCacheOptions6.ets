import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Row() {
        Button('Get options')
          .key('006')
          .onClick((event: ClickEvent) => {
            try {
              let options1 = new webview.BackForwardCacheOptions();
              options1.size = 3;
              options1.timeToLive = 10;
              this.controller.setBackForwardCacheOptions(options1);
              LocalContext.context.eventHub.emit('testSetBackForwardCacheOptionsTest0600', 1)
            } catch (error) {
              console.error(`Get options ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          })
      }

      Web({ src: 'www.example.com', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}