import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();

  build() {
    Column() {
      Button('Click')
        .key('10')
        .onClick(() => {
          const localFilePath = 'www.baidu.com';
          this.controller.loadUrl(localFilePath);
          LocalContext.context.eventHub.emit('testWebView_WebViewTest0010', 1)
        })

      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}