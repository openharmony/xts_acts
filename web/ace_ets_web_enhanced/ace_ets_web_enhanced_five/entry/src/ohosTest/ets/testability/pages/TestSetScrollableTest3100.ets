// xxx.ets
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  urltrustList6: string =
    '{\"UrlPermissionList\":[{\"scheme\":\"https\", \"host\":\"www.163.com\", \"port\":443, \"path\":\"test\"},' +
      '{\"scheme\":\"http\", \"host\":\"www.163.com\", \"port\":80, \"path\":\"test\"}]}'
  @State inputurl: string = ''

  build() {
    Column() {
      //搜素框
      TextInput({ placeholder: '输入网址...', text: this.inputurl })
        .id('input')
        .backgroundColor('#ececec')
        .width('50%')
        .height(30)
        .copyOption(CopyOptions.InApp)
        .onChange((value) => {
          this.inputurl = value
        })
      Button('Setting the trustlist')
        .key('001')
        .onClick(() => {
          try {
            // 设置白名单，只允许访问trust网页
            this.controller.setUrlTrustList(this.urltrustList6);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('Access the web')
        .key('002')
        .onClick(() => {
          try {
            // 白名单生效，此时不可以访问untrust网页，并弹出错误页
            this.controller.loadUrl(this.inputurl);
            LocalContext.context.eventHub.emit('TestSetScrollableTest3101', true)
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: $rawfile('index.html'), controller: this.controller }).onControllerAttached(() => {
        try {
          // onControllerAttached回调中设置白名单，可以保证在加载url之前生效，此时不可以访问untrust网页，并弹出错误页
          this.controller.setUrlTrustList(this.urltrustList6);
        } catch (error) {
          console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        }
      })
    }
  }
}