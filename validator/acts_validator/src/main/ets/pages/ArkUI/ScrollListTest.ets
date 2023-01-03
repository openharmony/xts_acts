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
import {CustomContainer} from '../common/CustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct CustomContainerUser {
  private listArr: number[] = Array.from(new Array(50).keys())
  @State name: string = 'ScrollingList';
  @State StepTips: string = '操作步骤：滑动列表观察是否能正常滑动'+'\n'+'预期结果：列表滑动正常';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      List() {
        ForEach(this.listArr,(item:any,index:number) => {
          ListItem() {
            Text('Item #' + (index + 1)).width('100%').height(50).fontSize(16).fontColor(Color.White).margin({left:'10vp'})
          }
        },index => index)
      }.height('100%').width('100%').divider({strokeWidth:1,color:Color.Grey})
    }.height('83%').width('100%')
  }
  build() {
    Column() {
      CustomContainer({
        title:this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam.bind(this),
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
