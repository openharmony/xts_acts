/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'startMediaSelectCallback4';
  @State StepTips: string = '测试步骤：点击“点击选择”按钮'+'\n'+'预期结果：可以选择多个视频资源';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击选择').margin('5%').fontSize(20).border({ width: 1 }).size({ width: '75%', height: '30%' })
          .onClick(() => {
            let TAG = 'startMediaSelectCallback4';
            let option : mediaLibrary.MediaSelectOption = {
              type : "video",
              count : 2
            };
            mediaLibrary.getMediaLibrary().startMediaSelect(option, (err, value) => {
              if (err) {
                console.log(TAG + "An error occurred when selecting image resources." + JSON.stringify(err));
                return;
              }
              console.log(TAG + "image resources selected." + JSON.stringify(value));
            });
          })
      }
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
       title: this.name,
       Url:'pages/MediaLibrary/MediaLibrary_index',
       StepTips:this.StepTips,
       content: this.specificNoParam,
       FillColor:$FillColor,
        name:$name
     })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}