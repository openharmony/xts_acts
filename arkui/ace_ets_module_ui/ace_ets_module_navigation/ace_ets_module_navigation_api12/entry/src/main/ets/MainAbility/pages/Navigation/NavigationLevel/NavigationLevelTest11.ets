/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct NavigationLevelTest11 {
  @State message:string = 'NavBar'
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pushPath pageTwo')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageTwo' , param:'mes'})
          })
          .id('NavigationLevelTest11_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('clear(false)')
          .onClick(() => {
            this.pageInfos.clear(false)
          })
          .id('NavigationLevelTest11_btn3')
      }
    }.title('pageTwo')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5}){
      Navigation(this.pageInfos) {
        Column({space:10}) {
          Text(this.message).id('NavigationLevelTest11_text1')

          Button('pushPath pageOne')
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
            })
            .id('NavigationLevelTest11_btn1')
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}

