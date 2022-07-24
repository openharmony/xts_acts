import events_emitter from '@ohos.events.emitter';
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


@Entry
@Component
struct CheckboxExample {

  @State flagTest:boolean = false


  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("scrollCode page state change called:" + JSON.stringify(eventData));
      this.flagTest = eventData.data.stateChange;
      console.info("scrollableValue:" + this.flagTest);
    } else {
      console.info("scrollCode page color not change called:" + JSON.stringify(eventData));
    }
  }


  onPageShow(){
    var stateChangeEvent = {
      eventId: 1850,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Scroll() {
      Column() {
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }){
          CheckboxGroup({group : 'checkboxGroup'})
            .selectedColor(0xed6f21)
            .onChange((itemName:CheckboxGroupResult) => {

              console.info("TextPicker::dialogResult is" + JSON.stringify(itemName.status))
              globalThis.status = itemName.status;
            })
          .key('CheckboxGroup')
          Text('select all').fontSize(20)
        }
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }){
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .select(false)
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {

              console.info('Checkbox1 change is' + value)
            })
          Text('Checkbox1').fontSize(20)
        }
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }){
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .select(false)
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value)
            })
            .key('Checkbox2')
          Text('Checkbox2').fontSize(20)
        }
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }){
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .select(false)
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              console.info('Checkbox3 change is' + value)
            })
          Text('Checkbox3').fontSize(20)
        }


      }

    }
  }
}