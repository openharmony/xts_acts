import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { OnPermissionRequestEvent, OnPageVisibleEvent, Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView, Web } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import hilog from '@ohos.hilog'

@Entry
@Component
struct webStorage {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State stateRst: string = "Xts test result"
  updateFlag: boolean = false

  build() {
    Column(undefined) {
      Text('WebStorageTest').fontSize(20)
      Web({ src: 'resource://rawfile/addOrigin.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .databaseAccess(this.databaseAccess)
        .onPageVisible((parameter: OnPageVisibleEvent): void => {
          hilog.info(0x000, 'testTag', '[Boruto]: Page OnPageVisibleEvent url:' + parameter.url);
          if (this.updateFlag) {
            this.stateRst = parameter.url;
          }
        })
        .onPermissionRequest((event: OnPermissionRequestEvent): void => {
          if (this.updateFlag && event) {
            hilog.info(0x000, 'testTag', '[Boruto]: Show request==>Origin:' + event.request.getOrigin());
            this.stateRst = event.request.getOrigin();
          }
        })
    }
  }
}
