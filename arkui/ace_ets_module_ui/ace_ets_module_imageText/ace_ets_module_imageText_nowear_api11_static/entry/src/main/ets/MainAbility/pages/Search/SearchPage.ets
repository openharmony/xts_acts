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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute,
  ClickEvent, UserView,Image,ImageFit,Color, TextAlign, CopyOptions, SearchController, Font, Search } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';

@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State copyValue: string = ''
  @State cutValue: string = ''
  @State pasteValue: string = ''
  @State positionValue: number = 1
  @State placeholder: string = 'Type to search...'
  @State icon: string = ''
  @State searchButton: string = 'SEARCH'
  @State placeholderColor: Color = Color.Grey
  @State placeholderFont: Font = { size: 14, weight: 400 } as Font
  @State textFont: Font = { size: 14, weight: 400 } as Font
  @State textAlign: TextAlign = TextAlign.Start
  @State copyOption: CopyOptions = CopyOptions.InApp
  controller: SearchController = new SearchController()
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('SearchPage onPageShow')
    // globalThis.value = {
    //   name:'messageManager',message:this.messageManager
    // }
    class MyClass {
      name: string;
      messageManager: MessageManager;
      message: MessageManager;

      constructor() {
        this.name = 'messageManager';
        this.messageManager = new MessageManager();
        this.message = this.messageManager;
      }
    }
    AppStorage.setOrCreate("value",  new MyClass(), Type.from<MyClass>());
    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeValue') {
        this.changeValue = message.value as String
      }
      if (message.name == 'submitValue') {
        this.submitValue = message.value as String
      }
      if (message.name == 'copyValue') {
        this.copyValue = message.value as String
      }
      if (message.name == 'cutValue') {
        this.cutValue = message.value as String
      }
      if (message.name == 'pasteValue') {
        this.pasteValue = message.value as String
      }
      if (message.name == 'positionValue') {
        this.positionValue = message.value as Number
      }
      if (message.name == 'placeHolder') {
        this.placeholder = message.value as String
      }
      if (message.name == 'icon') {
        this.icon = message.value as String
      }
      if (message.name == 'searchButton') {
        this.searchButton = message.value as String
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = message.value as Color
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = message.value as Font
      }
      if (message.name == 'textFont') {
        this.textFont = message.value as Font
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value as TextAlign
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value as CopyOptions
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text('onSubmit:' + this.submitValue).fontSize(10).key('submit').height('5%').textAlign(TextAlign.Center)
      Text('onChange:' + this.changeValue).fontSize(10).key('change').height('5%').textAlign(TextAlign.Center)
      Text('onCopy:' + this.copyValue).fontSize(10).key('copy').height('5%').textAlign(TextAlign.Center)
      Text('onCut:' + this.cutValue).fontSize(10).key('cut').height('5%').textAlign(TextAlign.Center)
      Text('onPaste:' + this.pasteValue).fontSize(10).key('paste').height('5%').textAlign(TextAlign.Center)
      Search({ value: this.changeValue, placeholder: this.placeholder, icon: this.icon, controller: this.controller })
        .searchButton(this.searchButton, {fontSize: 10}).id("searchButton")
        .width('80%')
        .height('10%')
        .key('search')
        .backgroundColor(Color.White)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .textAlign(this.textAlign)
        .copyOption(this.copyOption)
        .onSubmit((value: string): void => {
          this.submitValue = value
        })
        .onChange((value: string): void => {
          this.changeValue = value
        })
        .onCopy((value: string): void => {
          this.copyValue = value
        })
        .onCut((value: string): void => {
          this.cutValue = value
        })
        .onPaste((value: string): void => {
          this.pasteValue = value
        })
        .margin(20)
      Button('Set caretPosition ' + this.positionValue)
        .onClick((): void => {
          // 设置光标位置到输入的第一个字符后
          this.controller.caretPosition(this.positionValue)
        }).key('button').height('5%')
    }.width('100%')
  }
}