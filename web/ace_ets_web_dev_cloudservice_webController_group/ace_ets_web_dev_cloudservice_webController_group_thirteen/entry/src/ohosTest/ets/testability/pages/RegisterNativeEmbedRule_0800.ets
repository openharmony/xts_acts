// xxx.ets
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct RegisterNativeEmbedRule_0800 {
  @State embedStatus: string = '';
  @State embedinfos: string = '';
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();

  build() {
    Column() {
      // 默认行为：点击按钮跳转页面，关闭index页面，使同层标签销毁。
      // API12新增：使能同层渲染所在的页面支持BFCache后，点击按钮跳转页面，关闭index页面，使同层标签进入BFCache。
      Button('release')
        .key('001')
        .onClick(() => {
          try {
            const localFilePath = $rawfile('text8.html');
            this.controller.loadUrl(localFilePath);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      // API12新增：使能同层渲染所在的页面支持BFCache后，点击按钮返回页面，使同层标签离开BFCache。
      Button('backward')
        .key('002')
        .onClick(() => {
          try {
            this.controller.backward();
            LocalContext.context.eventHub.emit('registerNativeEmbedRule8002', true)
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      // API12新增同层标签进入离开BFCache状态：非http与https协议加载的网页，Web内核不支持进入BFCache;
      // 因此如果要测试ENTER_BFCACHE/LEAVE_BFCACHE状态，需要将index.html放到Web服务器上，使用http或者https协议加载;

      Web({
        src: 'www.example.com',
        controller: this.controller
      })
        .enableNativeEmbedMode(true)
        .registerNativeEmbedRule('object', 'AAbb')
        .onNativeEmbedLifecycleChange((event) => {
          // 当加载页面中有同层标签会触发Create。
          if (event.status == NativeEmbedStatus.CREATE) {
            this.embedStatus = 'Create'
            LocalContext.context.eventHub.emit('registerNativeEmbedRule8003', '08注册成功')
            LocalContext.context.eventHub.emit('registerNativeEmbedRule8004', 'Create')
          }
          // 当页面中同层标签移动或者缩放时会触发Update。
          if (event.status == NativeEmbedStatus.UPDATE) {
            this.embedStatus = 'Update';
            LocalContext.context.eventHub.emit('registerNativeEmbedRule8004', 'Update')
          }
          if (event.status == NativeEmbedStatus.DESTROY) {
            this.embedStatus = 'Destroy';
            LocalContext.context.eventHub.emit('registerNativeEmbedRule8005', 'Destroy')
          }
          
          console.log('status = ' + this.embedStatus);
          console.log('surfaceId = ' + event.surfaceId);
          console.log('embedId = ' + event.embedId);
          if (event.info) {
            console.log('id = ' + event.info.id);
            console.log('type = ' + event.info.type);
            console.log('src = ' + event.info.src);
            console.log('width = ' + event.info.width);
            console.log('height = ' + event.info.height);
            console.log('url = ' + event.info.url);
          }
        })
    }
  }
}