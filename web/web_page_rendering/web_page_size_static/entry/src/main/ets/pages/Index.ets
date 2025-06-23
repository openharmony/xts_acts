import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView, Web, WebAttribute, BusinessError } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import webview from '@ohos.web.webview'

@Entry
@Component
struct MyStateSample {
  @State pageHeightResult: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);
  build() {
    Column(undefined) {
      Button('GetPageHeight')
        .id('get_page_height_button')
        .onClick((e: ClickEvent) => {
          try {
            let pageHeight = this.webviewController.getPageHeight();
            this.pageHeightResult = 'pass';
            hilog.info(0x0000, 'testTag', "Test getPageHeight " + pageHeight);
          } catch (error) {
            this.pageHeightResult = '';
            hilog.info(0x0000, 'testTag', "Test getPageHeight failed. " + (error as BusinessError).code);
            hilog.info(0x0000, 'testTag', "Test getPageHeight failed. " + (error as BusinessError).message);
          }
        })
      Text(this.pageHeightResult).id('result_text');
      Web({src: 'resource://rawfile/index.html', controller: this.webviewController})
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
