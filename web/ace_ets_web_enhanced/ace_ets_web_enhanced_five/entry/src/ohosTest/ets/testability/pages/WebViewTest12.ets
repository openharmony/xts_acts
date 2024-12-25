import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onControllerAttached(() => {
          try {
            let id = this.controller1.getWebId();
          } catch (error) {
            console.error('ErrorCode:' + (error as BusinessError).code + 'Message:' + (error as BusinessError).message);
            LocalContext.context.eventHub.emit('testWebView_WebViewTest0012', (error as BusinessError).code)
          }
        })
    }
  }
}