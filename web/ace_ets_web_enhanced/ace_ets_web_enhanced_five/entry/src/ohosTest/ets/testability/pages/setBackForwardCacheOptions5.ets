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
        Button('Backward')
          .key('0050')
          .onClick((event: ClickEvent) => {
            try {
              this.controller.backward();
              LocalContext.context.eventHub.emit('testSetBackForwardCacheOptionsTest0501', 1)
            } catch (error) {
              console.error(`Backward ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          })
        Button('Forward')
          .key('0051')
          .onClick((event: ClickEvent) => {
            try {
              this.controller.forward();
              LocalContext.context.eventHub.emit('testSetBackForwardCacheOptionsTest0502', 1)
            } catch (error) {
              console.error(`Backward ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          })
      }

      Web({ src: 'www.example.com', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}