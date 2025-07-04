import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Web, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, OnGeolocationShowEvent, JsGeolocation} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import webView from '@ohos.web.webview';
import { Utils } from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }

  webviewController: webView.WebviewController = new webView.WebviewController(undefined);
  @State clickEvent: string = 'OnErrorReceive'
  @State geoAccess: boolean = false;
  @State geoShow: boolean = false;
  @State geoHide: boolean = false;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', "aboutToAppear");
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10
    }
    emitter.on(valueChangeEvent, (eventData: emitter.EventData) => {
      hilog.info(0x0000, 'testTag', "web page valueChangeCallBack");
      if (eventData != null) {
        hilog.info(0x0000, 'testTag', "valueChangeCallBack=" + JSON.stringify(eventData));
        if (eventData.data != null) {
          try {
            this.clickEvent = eventData?.data?.get("ACTION") as string;
            hilog.info(0x0000, 'testTag', "valueChangeCallBack clickEvent=" + this.clickEvent);
            this.webviewController.loadUrl('resource://rawfile/geo.html');
          } catch (error) {
            hilog.info(0x0000, 'testTag', 'ErrorCode: error');
          }
        }
      }
    })
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button("WebAttributeTestButton")
        .key('WebAttributeTestButton')
        .focusable(true)
        .onFocus(() => {
          hilog.info(0x0000, 'testTag', "onFocus==>")
        })
        .onBlur(() => {
          hilog.info(0x0000, 'testTag', "onBlur==>")
        })
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', "key==>" + this.clickEvent);
          switch (this.clickEvent) {
            case "GeolocationAccess": {
                try {
                  this.webviewController.loadUrl("resource://rawfile/geo.html")
                  Utils.emitEvent(this.geoAccess, 101);
                } catch (error) {
                  hilog.info(0x0000, 'testTag', 'ErrorCode: error');
                }
                break;
            }
            case "OnGeolocationShow": {
              try {
                this.webviewController.loadUrl("resource://rawfile/geo.html")
                Utils.emitEvent(this.geoShow, 102);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Button("WebviewContrllerTestButton")
        .key('WebviewContrllerTestButton')
        .focusable(true)
        .onFocus(() => {
          hilog.info(0x0000, 'testTag', "onFocus==>")
        })
        .onBlur(() => {
          hilog.info(0x0000, 'testTag', "onBlur==>")
        })
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', "key==>" + this.clickEvent);
          switch(this.clickEvent) {
            case "Constructor": {
              try {
                let geo = new JsGeolocation();
                Utils.emitEvent("done", 103);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Web({ src: "resource://rawfile/geo.html", controller: this.webviewController })
        .key('webView')
        .fileAccess(true)
        .width('100%')
        .databaseAccess(true)
        .geolocationAccess(true)
        .onGeolocationShow((event: OnGeolocationShowEvent): void => {
          if (event) {
            this.geoAccess = true
            hilog.info(0x0000, 'testTag', 'onGeolocationShow==> geoAccess:' + this.geoAccess)
            let geo : JsGeolocation = new JsGeolocation();
            geo = event.geolocation;
            geo.invoke(event.origin, true, false);
            this.geoShow = true
            hilog.info(0x0000, 'testTag', 'onGeolocationShow==> geoShow:' + this.geoShow)
          }
        })
        .onGeolocationHide(() => {
          this.geoHide = true
          hilog.info(0x0000, 'testTag', 'onGeolocationHide==> geoHide:' + this.geoHide)
        })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
