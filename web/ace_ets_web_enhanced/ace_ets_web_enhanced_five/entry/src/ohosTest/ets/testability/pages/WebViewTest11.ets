import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State step: number = 2;

  build() {
    Column() {
      Button('backOrForward')
        .key('11')
        .onClick(() => {
          try {
            this.controller.backOrForward(this.step);
            LocalContext.context.eventHub.emit('testWebView_WebViewTest0011', 1)
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}