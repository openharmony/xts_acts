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
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct customPopupExample12 {
  @State noHandlePopup: boolean = false;
  @State handlePopup: boolean = false;
  @State customPopup: boolean = false;
  @State enableArrow: boolean = true;
  @State placementOnTop: boolean = false;
  @State arrowWidth: Dimension = '20px';
  @State arrowHeight: Dimension = '20px';
  @State arrowPointPosition: ArrowPointPosition = ArrowPointPosition.START;

  @Builder
  popupBuilder() {
    Row({ space: 2 }) {
      Text('Custom Popup').fontSize(12).key('Custom_popup')
    }.width(100).height(50).backgroundColor(Color.White)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Button('custom popup')
        .key('custom1')
        .onClick(() => {
          this.customPopup = !this.customPopup
          try {
            let backData: events_emitter.EventData = {
              data: {
                "enableArrow": this.enableArrow,
                "arrowPointPosition": this.arrowPointPosition,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 67,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          arrowPointPosition: this.arrowPointPosition,
          popupColor: Color.White,
          enableArrow: this.enableArrow,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        })
        .position({ x: 100, y: 150 })
    }.width('100%').padding({ top: 5 })
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("customPopupOption page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.enableArrow != null) {
        this.enableArrow = eventData.data?.enableArrow;
      }
    }
  }
}