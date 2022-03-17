// @ts-nocheck
/**
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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct TextAreaExample2 {
  @State text: string = 'textArea';
  @State textAlign: TextAlign = TextAlign.Center;
  @State fontColor: string = "Color.Red";
  @State fontSize: number = 30;
  @State onActionCalledOne: boolean = false;
  @State onActionCalledTwo: boolean = false;

  onPageShow() {
    console.info('swiper page show called');
    var stateChangeEvent = {
      eventId: 1315,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    var stateChangeEventOne = {
      eventId: 1316,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    var stateChangeEventTwo = {
      eventId: 1317,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    var stateChangeEventThree = {
      eventId: 1318,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (eventData.data.fontSize != null) {
        this.fontSize = parseInt(eventData.data.fontSize);
      }
      if (eventData.data.fontColor != null) {
        this.fontColor = eventData.data.fontColor;
      }
      if (eventData.data.textAlign != null) {
        this.textAlign = eventData.data.textAlign;
      }
    }
  }

  build() {
    Column() {
      TextArea({ placeholder: 'input your word'})
        .key('textArea')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(this.textAlign)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(this.fontColor)
        .inputFilter('^[\u4E00-\u9FA5A-Za-z0-9_]+$',(value: string) => {
          console.info("hyb"+value)
        })
        .onChange((value: string) => {
          this.text = value
        })
        .onCut((value: string) => {
          this.text = value
          console.info(index.toString())
          this.onActionCalledOne = true;
          console.info('onChange current action state is: ' + this.onActionCalledOne);
          try {
            var backData = {
              data: {
                "ACTION": this.onActionCalledOne,
              }
            }
            var backEvent = {
              eventId: 2020,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onChange start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onChange emit action state err: " + JSON.stringify(err.message))
          }
        })
        .onPaste((value: string) => {
          this.text = value
          console.info(index.toString())
          this.onActionCalledTwo = true;
          console.info('onChange current action state is: ' + this.onActionCalledTwo);
          try {
            var backData = {
              data: {
                "ACTION": this.onActionCalledTwo,
              }
            }
            var backEvent = {
              eventId: 2021,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onChange start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onChange emit action state err: " + JSON.stringify(err.message))
          }
        })
      Text(this.text).width('90%').key('text')
      Button('caretPosition')
        .onClick(() => {
          this.controller.caretPosition(4)
        })
      }
    }
  }