import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State code: string = '';

  build() {
    Column() {
      Button('Click')
        .key('08')
        .onClick(() => {
          this.code = 'EUC-KR';
          const localFilePath = $rawfile('test.html');
          this.controller.loadUrl(localFilePath);
          LocalContext.context.eventHub.emit('testWebView_WebViewTest0008', 1)
        })

      Web({ src: 'www.example.com', controller: this.controller })
        .defaultTextEncodingFormat(this.code)
    }
  }
}