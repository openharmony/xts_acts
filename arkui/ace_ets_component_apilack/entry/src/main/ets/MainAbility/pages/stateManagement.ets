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

// 接口使用存在问题 页面无法加载 发生crash
//let storage = LocalStorage.GetShared()
//storage.setOrCreate('varA',1)
//storage.setAndLink('varA',2)
//storage.setAndProp('varC ',1)

@Entry
@Component
export default
struct StateManagementGetShared {

aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear StateManagementGetShared start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear StateManagementGetShared end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("stateManagement-GetShared")
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
        .key("GetSharedText")

      Text("stateManagement-SetOrCreate")
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
        .key("setOrCreateText")

      Text("stateManagement-SetAndLink")
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
        .key("setAndLinkText")

      Text("stateManagement-SetAndProp")
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
        .key("setAndPropText")
    
    }.width("100%").height("100%")
  }
}

