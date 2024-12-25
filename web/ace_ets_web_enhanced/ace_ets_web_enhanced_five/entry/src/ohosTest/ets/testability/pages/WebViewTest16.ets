import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State x: string = '';
  @State y: string = '';

  build() {
    Column() {
      Row() {
        TextInput({ placeholder: '请输入x值: ', text: this.x })
          .width('50%')
          .id('getX')
          .onChange((value) => {
            this.x = value
          })
        TextInput({ placeholder: '请输入y值: ', text: this.y })
          .width('50%')
          .id('getY')
          .onChange((value) => {
            this.y = value
          })
      }.justifyContent(FlexAlign.SpaceBetween)

      Button('scrollTo')
        .key('16')
        .onClick(() => {
          try {
            this.controller.scrollTo(Number(this.x), Number(this.y));
            LocalContext.context.eventHub.emit('testWebView_WebViewTest0016', 1)
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}