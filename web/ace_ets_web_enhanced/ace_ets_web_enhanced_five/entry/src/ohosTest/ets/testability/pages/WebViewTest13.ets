import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.controller })
        .onLoadIntercept((event) => {
          console.log('url:' + event.data.getRequestUrl());
          console.log('isMainFrame:' + event.data.isMainFrame());
          console.log('isRedirect:' + event.data.isRedirect());
          console.log('isRequestGesture:' + event.data.isRequestGesture());
          LocalContext.context.eventHub.emit('testWebView_WebViewTest0013', 1);
          return false;
        })
    }
  }
}
