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
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'storeMediaAssetCallback3';
  @State StepTips: string = '操作步骤:点击“点击保存”按钮'+'\n'+'预期结果：成功保存视频，资源内容为“hello world”';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam(){
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击保存').margin('2%').backgroundColor('#FFDDDDF8').fontSize(20).border({ width: 1 }).size({ width: '70%', height: '20%' })
          .onClick(async () => {
            let TAG = 'storeMediaAssetCallback3';
            let context0 = featureAbility.getContext();
              let data = await context0.getFilesDir();
              let time = new Date().getTime();
              console.log("data is"+ JSON.stringify(data));
              data = 'data/storage/el2/base/haps/entry';
              let PathMp4 = data + "/files/"+time + ".mp4";

              let srcFd =await fileio.open(PathMp4,0o102,0o0600);
              await fileio.write(srcFd,"hello world");
              await fileio.close(srcFd);

              let option = {
                src : PathMp4,
                mimeType : "video/mp4",
                relativePath : "Videos/"
              };
              mediaLibrary.getMediaLibrary().storeMediaAsset(option, (err, value) => {
                if (err) {
                  console.log(TAG + "An error occurred when storing videos resources."+ JSON.stringify(err));
                  return;
                }
                AlertDialog.show(
                  {
                    title: '保存成功',
                    message: '查询到Videos路径下新增一个.mp4格式的视频资源，资源内容为“hello world”',
                    confirm: {
                      value: 'OK',
                      action: () => {
                        console.info(TAG + 'Button-clicking callback')
                      }
                    },
                    cancel: () => {
                      console.info(TAG + 'Closed callbacks')
                    }
                  }
                )
                console.log(TAG + "videos resources stored. "+ JSON.stringify(value));
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