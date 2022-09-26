/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
export default struct Text_inputPhoneNumber {
  @State text: string = ''

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear Text_inputPhoneNumber start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear Text_inputPhoneNumber end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      TextInput({ placeholder: 'input your word' })
        .key("PhoneNumberText")
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .type(InputType.PhoneNumber)
        .onChange((value: string) => {
          this.text = value
        })

    }.width("100%").height("100%")
  }
}

