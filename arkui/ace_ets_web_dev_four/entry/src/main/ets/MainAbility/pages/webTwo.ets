
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import UIAbility from '@ohos.app.ability.UIAbility';
import business_error from '@ohos.base'

function Uint8ArrayToString(dataArray) {
  var dataString = ''
  for (var i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i])
  }
  return dataString
}

function ParseX509CertInfo(x509CertArray) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
    + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
    + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
    + x509CertArray[i].getNotBeforeTime()
    + ', valid end = ' + x509CertArray[i].getNotAfterTime()
  }
  return res
}


@Entry
@Component
struct Second {
    private localStorage: string =
      "if (typeof(Storage) !== 'undefined') {" +
      "   localStorage.setItem('color', 'Red');" +
      "}";
    @State outputStr: string = '' 
    @State firsttime:number = 0
    @State arr: Array<number> = [0, 0]
    webviewCtl: web_webview.WebviewController = new web_webview.WebviewController();
    delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
    failedData: Uint8Array = new Uint8Array();
    @State str:string="emitGetCertificate"
    @State downloadStateCodeA:number=web_webview.WebDownloadState.IN_PROGRESS
    @State downloadStateCodeB:number=web_webview.WebDownloadState.COMPLETED
    @State downloadStateCodeC:number=web_webview.WebDownloadState.CANCELED
    @State downloadStateCodeD:number=web_webview.WebDownloadState.INTERRUPTED
    @State downloadStateCodeE:number=web_webview.WebDownloadState.PENDING
    @State downloadStateCodeF:number=web_webview.WebDownloadState.PAUSED
    @State downloadStateCodeG:number=web_webview.WebDownloadState.UNKNOWN

    @State downloadErrorCodeA:number=web_webview.WebDownloadErrorCode.ERROR_UNKNOWN
    @State downloadErrorCodeB:number=web_webview.WebDownloadErrorCode.FILE_FAILED
    @State downloadErrorCodeC:number=web_webview.WebDownloadErrorCode.FILE_ACCESS_DENIED
    @State downloadErrorCodeD:number=web_webview.WebDownloadErrorCode.FILE_NO_SPACE
    @State downloadErrorCodeE:number=web_webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG
    @State downloadErrorCodeF:number=web_webview.WebDownloadErrorCode.FILE_TOO_LARGE
    @State downloadErrorCodeG:number=web_webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR
    @State downloadErrorCodeH:number=web_webview.WebDownloadErrorCode.FILE_BLOCKED
    @State downloadErrorCodeI:number=web_webview.WebDownloadErrorCode.FILE_TOO_SHORT
    @State downloadErrorCodeJ:number=web_webview.WebDownloadErrorCode.FILE_HASH_MISMATCH
    @State downloadErrorCodeK:number=web_webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE
    @State downloadErrorCodeL:number=web_webview.WebDownloadErrorCode.NETWORK_FAILED
    @State downloadErrorCodeM:number=web_webview.WebDownloadErrorCode.NETWORK_TIMEOUT
    @State downloadErrorCodeN:number=web_webview.WebDownloadErrorCode.NETWORK_DISCONNECTED
    @State downloadErrorCodeO:number=web_webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN
    @State downloadErrorCodeP:number=web_webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST
    @State downloadErrorCodeQ:number=web_webview.WebDownloadErrorCode.SERVER_FAILED
    @State downloadErrorCodeR:number=web_webview.WebDownloadErrorCode.SERVER_NO_RANGE
    @State downloadErrorCodeS:number=web_webview.WebDownloadErrorCode.SERVER_BAD_CONTENT
    @State downloadErrorCodeT:number=web_webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED
    @State downloadErrorCodeU:number=web_webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM
    @State downloadErrorCodeV:number=web_webview.WebDownloadErrorCode.SERVER_FORBIDDEN
    @State downloadErrorCodeW:number=web_webview.WebDownloadErrorCode.SERVER_UNREACHABLE
    @State downloadErrorCodeX:number=web_webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH
    @State downloadErrorCodeY:number=web_webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT
    @State downloadErrorCodeZ:number=web_webview.WebDownloadErrorCode.USER_CANCELED
    @State downloadErrorCodeAA:number=web_webview.WebDownloadErrorCode.USER_SHUTDOWN
    @State downloadErrorCodeBB:number=web_webview.WebDownloadErrorCode.CRASH

    @State modeA: OverScrollMode = OverScrollMode.ALWAYS
    @State modeB: WebLayoutMode = WebLayoutMode.FIT_CONTENT

    @State setDownloadDelegateKey:boolean = false
    

    @State scripts: Array<ScriptItem> = [
      { script: this.localStorage, scriptRules: ["*"] }
  ];
    


    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        };
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack);
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data.ACTION != null){
                 this.str = eventData.data.ACTION;
             }
        }
    }
    build(){
        Column(){
            Row(){
                Button("web click").key('webcomponenttwo').onClick(async ()=>{
                    console.info("key==>"+this.str);
                    switch(this.str){
                        case "emitGetCertificate":{
                            this.webviewCtl.loadUrl('https://www.baidu.com')
                            try {
                                this.webviewCtl.getCertificate().then(x509CertArray => {
                                this.outputStr = ParseX509CertInfo(x509CertArray);
                                console.info('11111111111111'+this.outputStr)
                                Utils.emitEvent(this.outputStr,4)
                                })
                            } catch (error) {
                                this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                            }
                        break;
                        }

                        case "emitonDownloadFailed":{
                            try {
                                this.webviewCtl.setDownloadDelegate(this.delegate);
                                Utils.emitEvent(true,6)
                            } catch (error) {
                                let e:business_error.BusinessError = error as business_error.BusinessError;
                                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                                }
                        break;
                        }

                        case "emitsetDownloadDelegate":{
                            try {
                                if (this.setDownloadDelegateKey) {
                                    this.webviewCtl.setDownloadDelegate(this.delegate);
                                }
                                Utils.emitEvent(true,8)
                            } catch (error) {
                                let e:business_error.BusinessError = error as business_error.BusinessError;
                                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                                }
                        break;
                        }

                        case "emitresumeDownload":{
                            try {
                                if (this.setDownloadDelegateKey) {
                                    web_webview.WebDownloadManager.resumeDownload(web_webview.WebDownloadItem.deserialize(this.failedData));
                                }
                                Utils.emitEvent(true,12)
                            } catch (error) {
                                let e:business_error.BusinessError = error as business_error.BusinessError;
                                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                                }
                        break;
                        }

                        case "emitPrefetchPage": {
                            try {
                                this.webviewCtl.removeCache(true)
                                this.webviewCtl.loadUrl('https://www.huawei.com')

                                if (this.arr.length > 2) {
                                    this.webviewCtl.removeCache(true)
                                }
                                this.webviewCtl.prefetchPage('https://www.huawei.com');
                                this.webviewCtl.loadUrl('https://www.huawei.com')

                                setTimeout(()=>{
                                    if (this.arr.length > 3) {
                                        if (this.arr[3]-this.arr[2] < 0) {
                                            Utils.emitEvent("success",6)
                                        }
                                    }
                                },2000)
                                
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }

                        case "emitPrepareForPageLoad": {
                            try {
                                this.webviewCtl.removeCache(true)
                                this.webviewCtl.loadUrl('https://www.jd.com/')
                                if (this.arr.length > 4) {
                                    this.webviewCtl.removeCache(true)
                                }
                                web_webview.WebviewController.prepareForPageLoad("https://www.jd.com/", true, 6);
                                this.webviewCtl.loadUrl('https://www.jd.com/')
                                setTimeout(()=>{
                                    if (this.arr.length > 5) {
                                        if (this.arr[5]-this.arr[4] < 0) {
                                            Utils.emitEvent("success",8)
                                        }
                                    }
                                },2000)  
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }

             
                        default:
                            console.info("can not match case");
                    }
                })
            }
            Web({ src: 'www.baidu.com', controller: this.webviewCtl })
            .fileAccess(true)
            .javaScriptAccess(true)
            .domStorageAccess(true)
            .onlineImageAccess(true)
            .javaScriptOnDocumentStart(this.scripts)
            .overScrollMode(OverScrollMode.NEVER)
            .onPageEnd((e) => {
                this.outputStr = 'onPageEnd : url = ' + e.url
            })
            .onFirstContentfulPaint(event => {
                console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
                event.navigationStartTick + ", [firstContentfulPaintMs]:" +
                event.firstContentfulPaintMs)
                this.firsttime = event.firstContentfulPaintMs - event.navigationStartTick/1000
                this.arr.push(this.firsttime)
            })
        }
    }
}