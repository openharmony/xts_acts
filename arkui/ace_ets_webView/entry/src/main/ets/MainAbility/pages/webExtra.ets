/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import prompt from '@ohos.prompt';
import web_webview from '@ohos.web.webview';
@Entry
@Component
struct WebComponent {
  controller: WebController = new WebController();
  @State ports: WebMessagePort[] = null;
  @State nativePorts: WebMessagePort = null;
  heads:Header[] = new Array();
  responseweb: WebResourceResponse = new WebResourceResponse();
  build() {
    Column() {
      Button('click')
        .onClick(()=>{
          var cache_Only = CacheMode.Only
          var cache_Default = CacheMode.Default
          var cache_None = CacheMode.None
          var cache_Online = CacheMode.Online
          var hit_EditText = HitTestType.EditText
          var hit_Email = HitTestType.Email
          var hit_HttpAnchor = HitTestType.HttpAnchor
          var hit_HttpAnchorImg = HitTestType.HttpAnchorImg
          var hit_Img = HitTestType.Img
          var hit_Map = HitTestType.Map
          var hit_Phone = HitTestType.Phone
          var hit_Unknown = HitTestType.Unknown
          var reason_ProcessAbnormalTermination = RenderExitReason.ProcessAbnormalTermination
          var reason_ProcessCrashed = RenderExitReason.ProcessCrashed
          var reason_ProcessExitUnknown = RenderExitReason.ProcessExitUnknown
          var reason_ProcessOom = RenderExitReason.ProcessOom
          var reason_ProcessWasKilled = RenderExitReason.ProcessWasKilled
          var sslerror_DateInvalid = SslError.DateInvalid
          var sslerror_HostMismatch = SslError.HostMismatch
          var sslerror_Invalid = SslError.Invalid
          var sslerror_Untrusted = SslError.Untrusted
          var file_FileOpenFolderMode = FileSelectorMode.FileOpenFolderMode
          var file_FileOpenMode = FileSelectorMode.FileOpenMode
          var file_FileOpenMultipleMode = FileSelectorMode.FileOpenMultipleMode
          var file_FileSaveMode = FileSelectorMode.FileSaveMode
          var pro_MidiSysex = ProtectedResourceType.MidiSysex
          this.ports = this.controller.createWebMessagePorts()
          var msgEvent = new WebMessageEvent();
          var sendPorts = new Array(this.ports[1]);
          msgEvent.setData("initial")
          msgEvent.setPorts(sendPorts)
          msgEvent.getData()
          msgEvent.getPorts()
          this.controller.postMessage({message: msgEvent, uri: "*"});
          this.nativePorts = this.ports[0]
          this.nativePorts.onMessageEvent((result: string)=>{
             return result
          })
          this.nativePorts.postMessageEvent(msgEvent)
          this.nativePorts.close()
          let hitValue = this.controller.getHitTestValue();
          console.log("hitType: " + hitValue.getType());
          console.log("extra: " + hitValue.getExtra());
          WebCookie.prototype.isFileURICookieAllowed();
          WebCookie.prototype.isCookieAllowed();
          WebCookie.prototype.isThirdPartyCookieAllowed();
          WebCookie.prototype.putAcceptCookieEnabled(true);
          WebCookie.prototype.putAcceptThirdPartyCookieEnabled(true);
          WebCookie.prototype.putAcceptFileURICookieEnabled(true);
          WebCookie.prototype.setCookie();
          WebCookie.prototype.setCookie('1','1');
          WebCookie.prototype.saveCookie();
          WebCookie.prototype.saveCookieSync();
          WebCookie.prototype.getCookie('1');
          WebCookie.prototype.existCookie();
          WebCookie.prototype.deleteEntireCookie();
          WebCookie.prototype.deleteSessionCookie();
          WebCookie.prototype.deleteExpiredCookie();
          this.controller.onInactive();
          this.controller.onActive();
          this.controller.zoom(1);
          this.controller.zoomIn();
          this.controller.zoomOut();
          this.controller.clearHistory();
          this.controller.refresh();
          this.controller.stop();
          this.controller.registerJavaScriptProxy({
            object:{
              test: (data) => {
                return "ArkUI Web Component";
              },
              toString: () => {
                console.log('Web Component toString');
              }
            },
            name: "objName",
            methodList: ["test", "toString"],
          });
          this.controller.deleteJavaScriptRegister("1")
          this.controller.getHitTest();
          this.controller.getHitTestValue();
          this.controller.getWebId();
          this.controller.getDefaultUserAgent();
          this.controller.getTitle();
          this.controller.getPageHeight();
          this.controller.requestFocus();
          this.controller.accessBackward();
          this.controller.accessForward();
          this.controller.accessStep(3);
          this.controller.backward();
          this.controller.forward();
          this.controller.backOrForward(5);
          this.controller.clearMatches();
          this.controller.searchNext(true);
          this.controller.clearSslCache();
          this.controller.clearClientAuthenticationCache();
        })
      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .fileFromUrlAccess(true)
        .onlineImageAccess(true)
        .domStorageAccess(true)
        .imageAccess(true)
        .mixedMode(MixedMode.All)
        .zoomAccess(true)
        .geolocationAccess(true)
        .password(true)
        .cacheMode(CacheMode.Only)
        .tableData(true)
        .wideViewModeAccess(true)
        .overviewModeAccess(true)
        .textZoomRatio(4)
        .textZoomAtio(6)
        .databaseAccess(true)
        .initialScale(9)
        .userAgent("1")
        .webDebuggingAccess(true)
        .mediaPlayGestureAccess(true)
        .onHttpErrorReceive((event) => {
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          console.log('isRedirect:' + event.request.isRedirect());
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          console.log('getResponseData:' + event.response.getResponseData());
          console.log('getResponseEncoding:' + event.response.getResponseEncoding());
          console.log('getResponseMimeType:' + event.response.getResponseMimeType());
          console.log('getResponseCode:' + event.response.getResponseCode());
          console.log('getReasonMessage:' + event.response.getReasonMessage());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          let resph = event.response.getResponseHeader();
          console.log('The response header result size is ' + resph.length);
          for (let i of resph) {
            console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
        })
        .onScroll((event) => {
          console.info("x = " + event.xOffset);
          console.info("y = " + event.yOffset);
        })
        .onSearchResultReceive(ret => {
          console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
          "[total]" + ret.numberOfMatches + "[isDone]"+ ret.isDoneCounting);
        })
        .onUrlLoadIntercept((event) => {
          console.log('onUrlLoadIntercept ' + event.data.toString())
          return true;
        })
        .onSslErrorEventReceive((event) => {
          AlertDialog.show({
            title: 'onSslErrorEventReceive',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.handleConfirm();
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.handleCancel();
              }
            },
            cancel: () => {
              event.handler.handleCancel();
            }
          })
          return true;
        })
        .onDownloadStart((event) => {
          console.log('url:' + event.url);
          console.log('userAgent:' + event.userAgent);
          console.log('contentDisposition:' + event.contentDisposition);
          console.log('contentLength:' + event.contentLength);
          console.log('mimetype:' + event.mimetype);
        })
        .onRefreshAccessedHistory((event) => {
          console.log('url:' + event.url + ' isReload:' + event.isRefreshed);
        })
        .onErrorReceive((event) => {
          console.log('getErrorInfo:' + event.error.getErrorInfo());
          console.log('getErrorCode:' + event.error.getErrorCode());
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          console.log('isRedirect:' + event.request.isRedirect());
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue);
          }
        })
        .onResourceLoad(()=>{console.log("Resource Load")})
        .onScaleChange(()=>{console.log("scale change")})
        .onPrompt((event) => {
          console.log("url:" + event.url);
          console.log("message:" + event.message);
          console.log("value:" + event.value);
          AlertDialog.show({
            title: 'onPrompt',
            message: 'text',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.result.handleCancel()
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                event.result.handleConfirm()
              }
            },
            cancel: () => {
              event.result.handleCancel()
            }
          })
          return true;
        })
        .onConfirm((event) => {
          console.log("event.url:" + event.url);
          console.log("event.message:" + event.message);
          console.log("event.result:" + event.result);
          AlertDialog.show({
            title: 'onConfirm',
            message: 'text',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.result.handleCancel()
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                event.result.handleConfirm()
              }
            },
            cancel: () => {
              event.result.handleCancel()
            }
          })
          return true;
        })
        .onBeforeUnload((event) => {
          console.log("event.url:" + event.url);
          console.log("event.message:" + event.message);
          AlertDialog.show({
            title: 'onBeforeUnload',
            message: 'text',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.result.handleCancel()
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                event.result.handleConfirm()
              }
            },
            cancel: () => {
              event.result.handleCancel()
            }
          })
          return true;
        })
        .onPageEnd((event)=>{
          var url = event.url
        })
        .onPageBegin((event)=>{
          var url = event.url
        })
        .onProgressChange((event)=>{
          var url = event.newProgress
        })
        .onTitleReceive((event)=>{
          var url = event.title
        })
        .onGeolocationHide(()=>{
          console.log("onGeolocationHide")
        })
        .onGeolocationShow(()=>{
          console.log("onGeolocationShow")
        })
        .onRequestSelected(()=>{
          console.log("onRequestSelected")})

        .javaScriptProxy(
          {
            object:{
              test: (data1, data2, data3) => {
                console.log("data1:" + data1);
                console.log("data2:" + data2);
                console.log("data3:" + data3);
                return "AceString";
              },
              toString: () => {
                console.log('toString' + "interface instead.");
              }
            },
            name: "objName",
            methodList: ["test", "toString"],
            controller: this.controller,
          }
        )
        .onShowFileSelector((event) => {
          AlertDialog.show({
            title: event.fileSelector.getTitle(),
            message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() +
            'acceptType:' + event.fileSelector.getAcceptType() + event.fileSelector.isCapture(),
            confirm: {
              value: 'upload',
              action: () => {
                let fileList: Array<string> = [
                  '/data/storage/el2/base/test',
                ]
                event.result.handleFileList(fileList)
              }
            },
            cancel: () => {
              let fileList: Array<string> = []
              event.result.handleFileList(fileList)
            }
          })
          return true;
        })
        .onAlert((event) => {
          AlertDialog.show({
            title: 'onAlert',
            message: 'text',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.result.handleCancel()
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                event.result.handleConfirm()
              }
            },
            cancel: () => {
              event.result.handlePromptConfirm("111")
            }
          })
          return true;
        })
        .onShowFileSelector((event) => {
          AlertDialog.show({
            title: event.fileSelector.getTitle(),
            message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() + 'acceptType:' + event.fileSelector.getAcceptType(),
            confirm: {
              value: 'upload',
              action: () => {
                let fileList: Array<string> = [
                  '/data/storage/el2/base/test',
                ]
                event.result.handleFileList(fileList)
              }
            },
            cancel: () => {
              let fileList: Array<string> = []
              event.result.handleFileList(fileList)
            }
          })
          return true;
        })
        .onHttpAuthRequest((event) => {
          AlertDialog.show({
            title: 'onHttpAuthRequest',
            message: 'text',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.cancel();
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                var httpAuth = event.handler.isHttpAuthInfoSaved();
                if (httpAuth == false) {
                  web_webview.WebDataBase.saveHttpAuthCredentials(
                    event.host,
                    event.realm,
                    "2222",
                    "2222"
                  )
                  event.handler.confirm('2222','2222');
                }
              }
            },
            cancel: () => {
              event.handler.cancel();
            }
          })
          return true;
        })
        .onSslErrorEventReceive((event) => {
          AlertDialog.show({
            title: 'onSslErrorEventReceive',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.handleConfirm();
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.handleCancel();
              }
            },
            cancel: () => {
              event.handler.handleCancel();
            }
          })
          return true;
        })
        .onRenderExited((event) => {
          console.log('reason:' + event.renderExitReason);
        })
        .onClientAuthenticationRequest((event) => {
          AlertDialog.show({
            title: 'onClientAuthenticationRequest',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.confirm("/system/etc/user.pk8", "/system/etc/chain-user.pem");
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.cancel();
              }
            },
            cancel: () => {
              event.handler.ignore();
            }
          })
          return true;
        })
        .onPermissionRequest((event) => {
          AlertDialog.show({
            title: 'title',
            message: 'text',
            primaryButton: {
              value: 'deny',
              action: () => {
                event.request.deny();
              }
            },
            secondaryButton: {
              value: 'onConfirm',
              action: () => {
                event.request.grant(event.request.getAccessibleResource());
              }
            },
            cancel: () => {
              event.request.getOrigin();
            }
          })
        })
        .onContextMenuShow((event) => {
          console.info("x coord = " + event.param.x());
          console.info("y coord = " + event.param.y());
          console.info("link url = " + event.param.getLinkUrl());
          console.info("UnfilterendLink url = " + event.param.getUnfilterendLinkUrl());
          console.info("Source url = " + event.param.getSourceUrl());
          console.info("existsImageContents = " + event.param.existsImageContents());
          console.info("existsMenuResult = " + event.result.closeContextMenu() + event.result.closeContextMenu() + event.result.copyImage());
          return true;
        })
        .onConsole((event) => {
          console.log('getMessage:' + event.message.getMessage());
          console.log('getSourceId:' + event.message.getSourceId());
          console.log('getLineNumber:' + event.message.getLineNumber());
          console.log('getMessageLevel:' + event.message.getMessageLevel());
          return false;
        })
        .onErrorReceive((event) => {
          console.log('getErrorInfo:' + event.error.getErrorInfo());
          console.log('getErrorCode:' + event.error.getErrorCode());
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          console.log('isRedirect:' + event.request.isRedirect());
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue);
          }
        })
        .onInterceptRequest((event) => {
          console.log('url:' + event.request.getRequestUrl());
          var head1:Header = {
            headerKey:"Connection",
            headerValue:"keep-alive"
          }
          var head2:Header = {
            headerKey:"Cache-Control",
            headerValue:"no-cache"
          }
          var length = this.heads.push(head1);
          length = this.heads.push(head2);
          this.responseweb.setResponseHeader(this.heads);
          this.responseweb.setResponseData("<!DOCTYPE html>\n");
          this.responseweb.setResponseEncoding('utf-8');
          this.responseweb.setResponseMimeType('text/html');
          this.responseweb.setResponseCode(200);
          this.responseweb.setReasonMessage('OK');
          this.responseweb.getResponseMimeType();
          this.responseweb.getResponseCode();
          this.responseweb.getReasonMessage();
          this.responseweb.getResponseHeader();
          return this.responseweb;
        })
        .onGeolocationShow((event) => {
          AlertDialog.show({
            title: 'title',
            message: 'text',
            confirm: {
              value: 'onConfirm',
              action: () => {
                event.geolocation.invoke(event.origin, true, true);
              }
            },
            cancel: () => {
              event.geolocation.invoke(event.origin, false, true);
            }
          })
        })

    }
  }
}