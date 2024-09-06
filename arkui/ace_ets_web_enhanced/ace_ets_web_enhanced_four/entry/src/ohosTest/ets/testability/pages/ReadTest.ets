import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { buffer } from '@kit.ArkTS';
import { LocalContext } from '../../test/GloablConfig';
import { temp, temps } from '../../test/Const';
import { URL } from './ConstConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  htmlData: string = '<html><body bgcolor="white">Source:<pre>source</pre></body></html>';

  build(){
    Column() {
      Button('postUrl').key('001')
        .onClick(async () => {
          try {
            console.log('[schemeHandler] postUrl');
            let postData: buffer.Buffer = buffer.from(this.htmlData);
            this.controller.postUrl(URL, postData.buffer);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Web({ src: URL, controller: this.controller })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest,
              resourceHandler: webview.WebResourceHandler) => {
              console.log('[schemeHandler] onRequestStart');
              try {
                let stream: webview.WebHttpBodyStream | null = request.getHttpBodyStream();
                if (stream) {
                  stream.initialize().then(() => {
                    if (!stream) {
                      return;
                    }
                    console.log('[schemeHandler] onRequestStart postDataStream size:' + stream.getSize());
                    console.log('[schemeHandler] onRequestStart postDataStream position:' + stream.getPosition());
                    console.log('[schemeHandler] onRequestStart postDataStream isChunked:' + stream.isChunked());
                    console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                    console.log('[schemeHandler] onRequestStart postDataStream isInMemory:' + stream.isInMemory());
                    stream.read(-1).then((buffer: ArrayBuffer) => {
                      if (!stream) {
                        return;
                      }
                      console.log('[schemeHandler] onRequestStart postDataStream readlength:' + buffer.byteLength);
                      console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                      console.log('[schemeHandler] onRequestStart postDataStream position:' + stream.getPosition());
                    }).catch((error: BusinessError) => {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    })
                  }).catch((error: BusinessError) => {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    LocalContext.context.eventHub.emit('ReadTest-error', JSON.stringify(error))
                  })
                } else {
                  console.log('[schemeHandler] onRequestStart has no http body stream');
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              return false;
            })

            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log('[schemeHandler] onRequestStop');
            });

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}
