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
import pluginComponentManager from '@ohos.pluginComponent'
const TAG = 'ets_apiLack_add';

@Entry
@Component
export default struct PluginComponentRequest {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PluginComponentRequest start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PluginComponentRequest end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("pluginComponent-Request")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("requestText")
        .onClick(() => {
          pluginComponentManager.request({
            want: {
              bundleName: "com.example.myapplication",
              abilityName: "com.example.myapplication.MainAbility",
            },
            name: "plugintemplate",
            data: {
              "key_1": "plugin component test",
              "key_2": 34234
            },
            jsonPath: ""
          }, (error, data) => {
            console.log("request_callback: data=" + JSON.stringify(data))
          })
        })

    }.width("100%").height("100%")
  }
}

