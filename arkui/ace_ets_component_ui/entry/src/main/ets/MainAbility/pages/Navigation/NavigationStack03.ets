/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct NavigationStack03 {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State getText: string = ''
  @Builder myBuilder2() {
    Column() {
      Button("close modal 2")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
  }
  @Builder myBuilder() {
    Column() {
      Button("transition modal 2")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow2 = true;
        }).bindContentCover(this.isShow2, this.myBuilder2(), {modalTransition: ModalTransition.DEFAULT, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Column(){
      Navigation() {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item:number) => {
              ListItem() {
                NavRouter(){
                  Text("NavRouter" + item).key(`NavigationStack03ListItemText${item}`)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination()
                    .onBlur(()=>{
                      this.flagBlur = 'BlurDone'
                    })
                    .backgroundColor(Color.Orange)

                }
              }
            },(item: number) => item.toString())
          }
          .width('80%')
          .margin({top:12})
        }
      }
      .key('NavigationStack03Navigation')
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor('FFFFFF')
      .bindContentCover(this.isShow, this.myBuilder(), {modalTransition: ModalTransition.NONE, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
      Text(this.getText).key('NavigationStack03getText').fontWeight(700)
      Text(this.flagBlur).key('NavigationStack03Blur').fontWeight(700)
      Text(this.flagFocus).key('NavigationStack03Focus').fontWeight(700)
      Button('YCDHL')
        .key('NavigationStack03True')
        .onClick(() => {
          this.bool = true
        })
      Button('get').key('NavigationStack03get')
        .onClick(() => {
          this.getText = JSON.stringify(this.pageInfos.getAllPathName()?.length)
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}