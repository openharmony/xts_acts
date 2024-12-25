import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  webViewController: webview.WebviewController = new webview.WebviewController()

  //接受当前页面的url

  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.webViewController })

      Column() {
        Button('baidu')
          .key('001')
          .onClick(() => {
            this.webViewController.loadUrl('www.baidu.com')
            setTimeout(() => {
              AlertDialog.show({
                message: '当前URL：www.baidu.com'
              })
            }, 2000)
            LocalContext.context.eventHub.emit('TestSetScrollableTest2401', true)
          })
          .margin({ bottom: 10 })

      }
      .height('50%')
    }
    .height('80%')
  }
}