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
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import { Driver, ON, UiDirection, BY, UiDriver } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebComponent {
  @State str: string = "getDefaultUserAgent01";
  @State defaultUserAgent:string = ''
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {
      Row() {
        Text('' + this.defaultUserAgent)
      }
      Row() {

        Button("web test").key('getDefaultUserAgentTest01').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "getDefaultUserAgent01": {
              let driver: Driver = await Driver.create()
              let button = await driver.findComponent(ON.id('getDefaultUserAgentButton'));
              await button.click();
              console.log('111'+this.defaultUserAgent)
              console.log('222'+this.defaultUserAgent.includes("Mozilla") )
              if ((this.defaultUserAgent).includes("Mozilla")) {
                Utils.emitEvent(true, 20241227)
              }

              break;
            }
          }
        })
      }
      Button('getDefaultUserAgent')
        .onClick(() => {
          let defaultUserAgent = webview.WebviewController.getDefaultUserAgent();
          this.defaultUserAgent = defaultUserAgent;
        }).key('getDefaultUserAgentButton')



    }
  }
}