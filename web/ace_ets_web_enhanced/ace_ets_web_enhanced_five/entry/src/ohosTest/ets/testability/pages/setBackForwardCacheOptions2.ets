import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';
import url from '@ohos.url';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Button('Get options')
        .key('001')
        .onClick((event: ClickEvent) => {
          try {
            let options = new webview.BackForwardCacheOptions();
            options.size = 3;
            options.timeToLive = 10;
            this.controller.setBackForwardCacheOptions(options);
            setTimeout(() => {
              options.size = 5;
              options.timeToLive = 15;
              setTimeout(() => {
                options.size = 4;
                options.timeToLive = 12;
              }, 1000);
            }, 2000);
          } catch (error) {
            console.error(`Get options ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('pushUrl')
        .key('002')
        .onClick(() => {
          router.pushUrl({
            url: 'testability/pages/Index1'
          })
          LocalContext.context.eventHub.emit('testSetBackForwardCacheOptionsTest0200', 1)
        })

      Web({ src: 'www.example.com', controller: this.controller })
        .height('100%')
        .width('100%')
    }
  }
}