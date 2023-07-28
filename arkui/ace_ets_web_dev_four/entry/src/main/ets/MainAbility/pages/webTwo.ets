
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
    @State outputStr: string = '' 
    @State firsttime:number = 0
    @State arr: Array<number> = [0, 0]
    webviewCtl: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitGetCertificate"
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