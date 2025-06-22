import {
  memo,
  State
} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins // should be insert by ui-plugins
import {
  Button,
  ClickEvent,
  Column,
  Component,
  ContextMenuInputFieldType,
  ContextMenuMediaType,
  ContextMenuSourceType,
  Entry,
  Row,
  Text,
  TextInput,
  TextAttribute,
  Web,
  OnConfirmEvent,
  OnPromptEvent,
  Callback
} from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import hilog from '@ohos.hilog'

import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import JSON from '@ohos.util.json';
import image from '@ohos.multimedia.image';
import { sendEventByKey } from '@internal.full.global';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State consoleMsg: string = ''
  @State searchResultCount: number = -1
  @State consoleCorsError: boolean = false
  @State flag: boolean = false
  @State handleCancel: boolean = false;
  @State confirm: string = ""
  @State prompt: string = ""

  onPageShow() {
    console.log('lichenwei: onPageShow')
    hilog.info(0x0000, 'testTag', 'lichenwei: onPageShow');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    // console.info("web page valueChangeCallBack");
    // if (eventData != null) {
    //   console.info("valueChangeCallBack:" + JSON.stringify(eventData));
    //   if (eventData.data != null && eventData.data['ACTION'] != null) {
    //     this.str = eventData.data['ACTION'];
    //   }
    // }
    this.str = JSON.stringify(eventData?.data?.["ACTION"]).replaceAll('"', '');
    console.log('lichenwei: valueChangeCallBack str: ' + this.str)
  }
  aboutToAppear() {
    console.log('lichenwei: aboutToAppear')
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  build() {
    Column() {
      Row() {
        Button("WebInitTestButton").key('WebInitTestButton').onClick((event: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'lichenwei: WebInitTestButton click key==>' + this.str);
          switch (this.str) {

            case "emitContextMenuMediaType": {
              try {
                let con = ContextMenuMediaType.Image;
                // await Utils.sleep(1000)
                Utils.emitEvent(con, 33);
                console.log("result: " + con);
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitContextMenuInputFieldType": {
              try {
                Utils.emitEvent(ContextMenuInputFieldType.PlainText, 34);
                Utils.emitEvent(ContextMenuInputFieldType.Telephone, 35);
                Utils.emitEvent(ContextMenuInputFieldType.Other, 36);
                console.log("result: " + ContextMenuInputFieldType.PlainText);
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ContextMenuSourceType": {
              try {
                Utils.emitEvent(ContextMenuSourceType.None, 37);
                Utils.emitEvent(ContextMenuSourceType.Mouse, 38);
                Utils.emitEvent(ContextMenuSourceType.LongPress, 39);
                console.log("result: " + ContextMenuSourceType.LongPress);
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetRequestFocus": {
              // await Utils.sleep(2000);
              setTimeout(() => {
                Utils.clickComponent('textInput')
              }, 2000)
              break;
            }
            case "emitScrollableEleven": {
              this.controller.setScrollable(false);
              // await Utils.sleep(2000);
              try {
                let scrollEnabled = this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
                setTimeout(() => {
                  Utils.emitEvent(scrollEnabled, 234234)
                }, 2000)
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitScrollableTwelve": {
              this.controller.setScrollable(true);
              // await Utils.sleep(2000);
              try {
                let scrollEnabled = this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
                setTimeout(() => {
                  Utils.emitEvent(scrollEnabled, 236236)
                }, 2000)
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsResultHandleCancel001": {
              try {
                this.handleCancel = true
                this.controller.loadUrl("resource://rawfile/confirm.html");
                // await Utils.sleep(2000)
                this.controller.runJavaScript("confirmTest()", (error, result) => {
                  if (error) {
                    console.info('confirmTest() return error: ' + error)
                  }
                  if (result) {
                    console.info('confirmTest() return result: ' + result)
                    setTimeout(() => {
                      Utils.emitEvent(result, 70021)
                    }, 2000)
                  }
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsResultHandleConfirm001": {
              try {
                this.handleCancel = false
                this.controller.loadUrl("resource://rawfile/confirm.html");
                // await Utils.sleep(2000)
                this.controller.runJavaScript("confirmTest()", (error, result) => {
                  if (error) {
                    console.info('confirmTest() return error: ' + error)
                  }
                  if (result) {
                    console.info('confirmTest() return result: ' + result)
                    setTimeout(() => {
                      Utils.emitEvent(result, 70023)
                    }, 2000)
                  }
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsResultHandlePromptConfirm001": {
              try {
                this.controller.loadUrl("resource://rawfile/prompt.html");
                // await Utils.sleep(2000)
                this.controller.runJavaScript("promptTest()", (error, result) => {
                  if (error) {
                    console.info('promptTest() return error: ' + error)
                  }
                  if (result) {
                    console.info('promptTest() return result: ' + result)
                    setTimeout(() => {
                      Utils.emitEvent(result, 70025)
                    }, 2000)
                  }
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "back": {
              try {
                this.getUIContext().getRouter().back()
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      TextInput({ placeholder: "inputs your words" })
        .key('textInput')
        .height(60)
        .fontSize(30)
        .fontFamily("cursive")
        .maxLength(20)
        .onClick((event: ClickEvent) => {
          console.info("TextInput click")
        })

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onFocus(() => {
          Utils.emitEvent("requestFocus", 126);
        })
        .onBlur(() => {
          console.info("onBlur==>");
          this.controller.requestFocus();
        })
        .onConfirm((event: OnConfirmEvent) => {
          if (event) {
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            this.confirm = event.message;
            if (this.handleCancel) {
              event.result.handleCancel()
            } else {
              event.result.handleConfirm()
            }
          }
          return true
        } as Callback<OnConfirmEvent, boolean>)
        .onPrompt((event: OnPromptEvent) => {
          if (event) {
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            console.log("event.value:" + event.value)
            this.prompt = event.message;
            event.result.handlePromptConfirm('handlePromptConfirm')
          }
          return true
        } as Callback<OnPromptEvent, boolean>)
    }
  }
}