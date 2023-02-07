/*
 * Copyright (c) 2023-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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

import {MessageManager,Callback} from './../../../../common/MessageManager';
@Entry
@Component
struct AlignSpaceEvenly_AddLayoutWeight {
  @State OneLayoutWeight: number = 2;
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('AlignSpaceEvenly_NoSpace onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'OneLayoutWeight') {
        this.OneLayoutWeight = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  @State justifyContent: FlexAlign = FlexAlign.SpaceEvenly
  build() {
      Column() {
        Text('justifyContent:FlexAlign.SpaceEvenly').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row }) {
          Text('1')
            .width(150)
            .height(50)
            .backgroundColor(0xF5DEB3)
            .key("SpaceEvenly_AddLayoutWeight_011")
            .layoutWeight(this.OneLayoutWeight)
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key("SpaceEvenly_AddLayoutWeight_012")
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key("SpaceEvenly_AddLayoutWeight_013")
        }
        .key("SpaceEvenly_AddLayoutWeight_01")
        .width(500)
        .height(200)
        .backgroundColor(0xAFEEEE)
      }
    }
}
