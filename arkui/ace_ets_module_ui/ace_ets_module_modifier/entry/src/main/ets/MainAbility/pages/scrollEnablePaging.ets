/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { ScrollModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ScrollModifier {
	applyNormalAttribute(instance: ScrollAttribute): void {
		super.applyNormalAttribute?.(instance);
	}
}

@Entry
@Component
struct ScrollEnablePaging {

  @State customModifier: ScrollModifier = new CustomModifier().enablePaging(true)
  
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height("20%")
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .onClick(() => {
                try {
                  let backData: events_emitter.EventData = {
                    data: {
                      "itemNumber": item,
                    }
                  }
                  let backEvent: events_emitter.InnerEvent = {
                    eventId: 79002,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("scroll NestedScrollOptionsScroll start to emit action state");
                  events_emitter.emit(backEvent, backData);
                } catch (err) {
                  console.info("scroll NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
                }
              })
          }, (item: string) => item)
        }.width('100%')
      }
      .attributeModifier(this.customModifier as CustomModifier)
        .key("ScrollTest")
    }.width('100%')
      .height("100%")
  }
}