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
struct CommonPage {

  @State isEnable: boolean = true


  @Styles pressedStyles() {
    .backgroundColor("#ED6F21")
    .borderRadius(10)
    .borderStyle(BorderStyle.Dashed)
    .borderWidth(2)
    .borderColor("#33000000")
    .width(120)
    .height(30)
    .opacity(1)
  }

  @Styles clickedStyles() {
    .backgroundColor("#ffd23535")
    .borderRadius(10)
    .borderStyle(BorderStyle.Solid)
    .borderWidth(2)
    .borderColor("#2a10d497")
    .width(90)
    .height(25)
    .opacity(1)
  }

  @Styles normalStyles() {
    .backgroundColor("#0A59F7")
    .borderRadius(10)
    .borderStyle(BorderStyle.Solid)
    .borderWidth(2)
    .borderColor("#33000000")
    .width(100)
    .height(25)
    .opacity(1)
  }

  build() {
    Column({ space: 10 }) {
      Button() {
        Text('onKeyTab').fontSize(25).fontWeight(FontWeight.Bold)
      }.margin({ top: 20 }).backgroundColor('#0D9FFB')
      .onKeyEvent((event:KeyEvent) => {

        globalThis.deviceId = event.deviceId;
        globalThis.keyCode = event.keyCode;
        globalThis.keySource = event.keySource;
        globalThis.keyText = event.keyText;
        globalThis.metaKey = event.metaKey;

        console.info('keyEvent deviceId + ' +event.deviceId)
        console.info('keyEvent keyCode : ' +event.keyCode)
        console.info('keyEvent keySource : ' +event.keySource)
        console.info('keyEvent keyText : ' +event.keyText)
        console.info('keyEvent metaKey : ' +event.metaKey)


      })

      Text("normal")
        .fontSize(14)
        .fontColor(Color.White)
        .opacity(0.5)
        .stateStyles({
          normal: this.normalStyles,
        })
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)
      .key('normal')
      Text("pressed")
        .backgroundColor("#0A59F7")
        .borderRadius(20)
        .borderStyle(BorderStyle.Dotted)
        .borderWidth(2)
        .borderColor(Color.Red)
        .width(100)
        .height(25)
        .opacity(1)
        .fontSize(14)
        .fontColor(Color.White)
        .stateStyles({
          pressed: this.pressedStyles,
        })
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)
      .key('pressed')

      Text(this.isEnable ? "effective" : "clicked")
        .backgroundColor("#0A59F7")
        .borderRadius(20)
        .borderStyle(BorderStyle.Solid)
        .borderWidth(2)
        .borderColor(Color.Gray)
        .width(100)
        .height(25)
        .opacity(1)
        .fontSize(14)
        .fontColor(Color.White)
//        .enabled(this.isEnable)
        .stateStyles({
          clicked: this.clickedStyles,
        })
        .onClick((event:ClickEvent) => {
          console.info('globalPosition'+event.target.area.globalPosition.x)
          console.info('globalPosition'+event.target.area.globalPosition.y)
          globalThis.globalPositionX = event.target.area.globalPosition.x;
          globalThis.globalPositionY = event.target.area.globalPosition.y;
          this.isEnable = !this.isEnable
          console.log(`${this.isEnable}`)
        })
        .textAlign(TextAlign.Center)
      .key('clicked')
    }
  }
}