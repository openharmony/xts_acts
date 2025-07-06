/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { OnWindowNewEvent, CacheMode, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { setTimeout } from '@internal.full.global';
import { Utils } from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct WebViewEnumAndSetWebController {
  @State str: string = ''
  @State cacheMode: CacheMode = CacheMode.None
  @State flag: Boolean = false
  controller: webView.WebviewController = new webView.WebviewController(undefined);

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data?.['ACTION'] != null) {
        this.str = '' + eventData.data?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web clicks').key('buttonSetWebController').onClick((event: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitSetWebControllerTest': {
              this.flag = true;
              console.info('Set flag = ' + this.flag)
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/ControllerHandler.html', controller: this.controller })
        .key('WebViewEnumAndSetWebControllerWebView')
        .cacheMode(this.cacheMode)
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowNew((event: OnWindowNewEvent): void => {
          console.info('Entry onWindowNew')
          event.handler.setWebController(this.controller)
          console.info('Finish setWebController')
          setTimeout(() => {
            if (this.flag) {
              Utils.emitEvent(true, 1320)
            }
          }, 3000)
        })
        .onWindowExit(() => {
          console.info('closeWindow')
        })
    }
  }
}
