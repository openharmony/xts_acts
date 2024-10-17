/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Util';
import { BusinessError } from '@kit.BasicServicesKit';
import { cert } from '@kit.DeviceCertificateKit';
import { fileIo } from '@kit.CoreFileKit';

class TestObj {
  constructor(){
  }

  test(str: string): ArrayBuffer{
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct Index {
  @State str: string = '';
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State testObjtest: TestObj = new TestObj();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State customUserAgent: string = 'test'
  scheme1: webview.WebCustomScheme = { schemeName: 'null', isSupportCORS: true, isSupportFetch: true };
  scheme2: webview.WebCustomScheme = { schemeName: 'name2', isSupportCORS: true, isSupportFetch: true };
  scheme3: webview.WebCustomScheme = { schemeName: 'name3', isSupportCORS: true, isSupportFetch: true };

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  Uint8ArrayToString(dataArray: Uint8Array){
    let dataString = '';
    for (let i = 0; i < dataArray.length; i++) {
      dataString += String.fromCharCode(dataArray[i]);
    }
    return dataString;
  }

  ParseX509CertInfo(x509CertArray: Array<cert.X509Cert>){
    let res: string = 'getCertificate success: len = ' + x509CertArray.length;
    for (let i = 0; i < x509CertArray.length; i++) {
      res += ', index = ' + i + ', issuer name = '
        + this.Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
        + this.Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
        + x509CertArray[i].getNotBeforeTime()
        + ', valid end = ' + x509CertArray[i].getNotAfterTime();
    }
    return res;
  }

  build(){
    Column() {
      Button('button')
        .key('eight')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_9700':
              try {
                this.controller1.resumeAllMedia();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 530)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_9800':
              try {
                this.controller1.pauseAllMedia();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 531)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_9900':
              try {
                this.controller1.stopAllMedia();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 532)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10000':
              try {
                webview.WebviewController.resumeAllTimers();
                Utils.emitEvent(true, 533)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 533)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10100':
              try {
                webview.WebviewController.pauseAllTimers();
                Utils.emitEvent(true, 534)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 534)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10200':
              try {
                this.controller.setPrintBackground(null);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 535)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10300':
              try {
                this.controller1.getPrintBackground()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 536)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10400':
              try {
                this.controller1.setPrintBackground(false)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 537)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10500':
              try {
                this.controller1.getScrollable()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 538)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10600':
              try {
                this.controller.setScrollable(null)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 539)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10700':
              try {
                this.controller1.getSecurityLevel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 540)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10800':
              try {
                this.controller1.isIncognitoMode()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 541)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_10900':
              try {
                this.controller.createWebPrintDocumentAdapter(null)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 542)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11000':
              try {
                this.controller1.createWebPrintDocumentAdapter('你好')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 543)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11100':
              try {
                let postData = this.testObjtest.test('Name=test&Password=test');
                this.controller1.postUrl('www.example.com', postData)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 544)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11200':
              try {
                let postData = this.testObjtest.test('Name=test&Password=test');
                this.controller.postUrl(null, postData)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 545)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11300':
              try {

                this.controller1.terminateRenderProcess()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 546)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11400':
              try {
                webview.WebviewController.setRenderProcessMode(null);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 547)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11500':
              try {
                webview.WebviewController.setConnectionTimeout(-1);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 548)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11600':
              try {
                this.controller1.getCustomUserAgent()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 549)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11700':
              try {
                this.controller1.startDownload('www.baidu.com')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 550)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11800':
              try {
                this.controller.startDownload('wwe1y84782hehggeom')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 551)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_11900':
              try {
                this.controller1.setDownloadDelegate(this.delegate)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 552)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12000':
              try {
                let userAgent = this.controller.getUserAgent() + this.customUserAgent;
                this.controller1.setCustomUserAgent(userAgent)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 553)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12100':
              try {
                let userAgent = null;
                this.controller1.setCustomUserAgent(userAgent)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 554)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12200':
              try {
                webview.WebviewController.prepareForPageLoad('htfsigiedgidehgeh549649646ple.com', true, 2);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 555)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12300':
              try {
                webview.WebviewController.prepareForPageLoad('www.baidu.com', true, 0.2343534647);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 556)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12400':
              try {
                this.controller1.prefetchPage('www.baidu.com')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 557)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12500':
              try {
                this.controller1.prefetchPage('ww48928432rehghdgrhrom')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 558)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12600':
              try {
                this.controller1.setAudioMuted(true)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 559)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12700':
              try {
                this.controller.setAudioMuted(null)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 560)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12800':
              try {
                let outputStr = ''
                this.controller1.getCertificate().then((x509CertArray: Array<cert.X509Cert>) => {
                  outputStr = this.ParseX509CertInfo(x509CertArray);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 561)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_12900':
              try {
                let outputStr = ''
                this.controller1.getCertificate((error: BusinessError, x509CertArray: Array<cert.X509Cert>) => {
                  if (error) {
                    outputStr = 'getCertificate failed: ' + error.code + ', errMsg: ' + error.message;
                  } else {
                    outputStr = this.ParseX509CertInfo(x509CertArray);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 562)
              }
              break;

            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13000':
              try {
                webview.WebviewController.customizeSchemes(null);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 563)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13100':
              try {
                let path: string | undefined = AppStorage.get('cacheDir');
                if (path) {
                  path += '/WebState';
                  // 以同步方法打开文件。
                  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
                  let stat = fileIo.statSync(path);
                  let size = stat.size;
                  let buf = new ArrayBuffer(size);
                  fileIo.read(file.fd, buf, (err, readLen) => {
                    if (err) {
                      console.info('mkdir failed with error message: ' + err.message + ', error code: ' + err.code);
                    } else {
                      console.info('read file data succeed');
                      this.controller1.restoreWebState(new Uint8Array(buf.slice(0, readLen)));
                      fileIo.closeSync(file);
                    }
                  });
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 564)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13300':
              try {
                let state = this.controller1.serializeWebState();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 565)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13400':
              try {
                let list = this.controller1.getBackForwardEntries()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 566)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13500':
              try {
                this.controller1.pageDown(true);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 567)
              }
              break;
            case 'SUB_WEB_ERRORCODEANDERRORMESSAGE_13600':
              try {
                this.controller.pageDown(null);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 568)
              }
              break;
          }

        })

      Web({ src: 'www.example.com', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}