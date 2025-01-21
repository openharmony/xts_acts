/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';


@Entry
@Component
struct optimizeParserBudget {
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State budgetValue: boolean = true;
  @State text: string = '';

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }
  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return 'web222';
    }
  }
  build(){
    Column() {
      Row() {
        Button('optimizeParserBudget click').key('optimizeParserBudgetButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          await Utils.sleep(1000)
          switch (this.emitKey) {
            case 'optimizeParserBudgetTrue': {
              console.log('optimizeParserBudgetTrue begin')
              Utils.emitEvent('success', 30001)
            }
          }
          switch (this.emitKey) {
            case 'optimizeParserBudgetFalse': {
              this.budgetValue = false;
              console.log('optimizeParserBudgetFalse begin')
              Utils.emitEvent('success', 30002)
            }
          }
        })
      }
      Text('' + this.text);
      Web({ src: $rawfile('index.html'), controller: this.webviewController})
        .javaScriptAccess(true)
        .optimizeParserBudget(this.budgetValue)
    }
  }
}
