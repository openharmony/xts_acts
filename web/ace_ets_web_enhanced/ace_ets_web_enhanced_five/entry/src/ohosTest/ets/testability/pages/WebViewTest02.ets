import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State status: number = 0;

  build() {
    Column() {
      Button('response')
        .key('02')
        .onClick(() => {
          let response = new webview.WebSchemeHandlerResponse();
          try {
            response.setUrl('www.example.com')
            response.setStatus(200)
            this.status = response.getStatus()
            response.setStatusText('OK')
            response.setMimeType('text/html')
            response.setEncoding('utf-8')
            response.setHeaderByName('header1', 'value1', false)
            response.setNetErrorCode(WebNetErrorList.NET_OK)
            console.log('[schemeHandler] getUrl:' + response.getUrl())
            console.log('[schemeHandler] getStatus:' + response.getStatus())
            console.log('[schemeHandler] getStatusText:' + response.getStatusText())
            console.log('[schemeHandler] getMimeType:' + response.getMimeType())
            console.log('[schemeHandler] getEncoding:' + response.getEncoding())
            console.log('[schemeHandler] getHeaderByValue:' + response.getHeaderByName('header1'))
            console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
            LocalContext.context.eventHub.emit('testWebView_WebViewTest0002', this.status)
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
      TextInput({ text: String(this.status) })
    }
  }
}
