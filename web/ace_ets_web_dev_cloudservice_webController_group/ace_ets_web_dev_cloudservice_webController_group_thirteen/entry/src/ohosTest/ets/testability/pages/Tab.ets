// xxx.ets
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct enableNativeEmbedMode_0100 {
  @State embedStatus: string = '';
  @State embedinfos: string = '';
  @State back: boolean = true;
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();

  build() {
    Column() {
      // 默认行为：点击按钮跳转页面，关闭index页面，使同层标签销毁。
      // API12新增：使能同层渲染所在的页面支持BFCache后，点击按钮跳转页面，关闭index页面，使同层标签进入BFCache。

      // API12新增：使能同层渲染所在的页面支持BFCache后，点击按钮返回页面，使同层标签离开BFCache。
      Button('backward')
        .key('002')
        .onClick(() => {
          setTimeout(() => {
            try {
              router.back()
              LocalContext.context.eventHub.emit('NativeVideoPlayerBFCache2003', 2);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          }, 2000)
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}