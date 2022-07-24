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
@Entry
@Component
struct SideBarPage {
  normalIcon : Resource = $rawfile('person.png')
  selectedIcon: Resource = $rawfile('hand.png')
  @State arr: number[] = [1, 2, 3]
  @State current: number = 1

  buttonStyle: ButtonStyle = {
    left:30,
    icons:{
      shown: '显示',
      hidden: '隐藏',
      switching:'过程'
    }


  }

  build() {
    SideBarContainer(SideBarContainerType.Embed)
    {
      Column() {
        ForEach(this.arr, (item, index) => {
          Column({ space: 5 }) {
            Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
            Text("Index0" + item)
              .fontSize(25)
              .fontColor(this.current === item ? '#0A59F7' : '#999')
              .fontFamily('source-sans-pro,cursive,sans-serif')
          }
          .onClick(() => {
            this.current = item
          })
        }, item => item)
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor('#fc2efd42')
      RowSplit() {
        Column(){
          Text('Split page one').fontSize(30)
        }.justifyContent(FlexAlign.Center)
        Column(){
          Text('Split page two').fontSize(30)
        }.justifyContent(FlexAlign.Center)
      }.width('100%').backgroundColor('#ffd94444')
    }
    .key('sideBar')
    .sideBarWidth(240)
    .controlButton(this.buttonStyle)
    .minSideBarWidth(210)
    .maxSideBarWidth(260)
    .onChange((value: boolean) => {
      console.info('status:' + value)
    })
  }
}