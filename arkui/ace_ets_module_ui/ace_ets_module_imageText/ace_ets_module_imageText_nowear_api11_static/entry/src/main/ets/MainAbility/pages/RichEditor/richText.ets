/**
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
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Flex, Padding,FlexDirection,ItemAlign,
  FlexAlign,Column,RichText
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager } from '../../utils/MessageManager'

@Entry
@Component
struct RichTextCreateComponent {
  @State data: string = "test data";
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    AppStorage.setOrCreate<object>("imageNamePng", this.messageManager, Type.from<object>());
    console.info('[list] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 181,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called:" + JSON.stringify(eventData));
      if (eventData.data?.['data'] != null && eventData.data?.['data'] != undefined) {
        this.data = eventData.data?.['data'] as string;
      }
    }
  }

  build() {
    Flex({
      direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Column() {
        RichText(this.data)
          .onStart(() => {
            console.info("RichText onStart")
          })
          .onComplete(() => {
            console.info("RichText onComplete")
          })
      }

    }.padding({ top: 30 } as Padding)
  }
}