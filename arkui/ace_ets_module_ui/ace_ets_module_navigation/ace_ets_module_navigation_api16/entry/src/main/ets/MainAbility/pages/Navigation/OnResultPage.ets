/*
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
struct OnResultPage {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne()
    } else if (name == 'pageTwo') {
      PageTwo()
    } else if (name == 'pageDialog') {
      PageThree()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'}) {
        Button('push pageOne').id('pushId').onClick(() => {
          this.pageInfos.pushPath({name: 'pageOne'} )
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
  }
}

@Component
struct PageOne {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State info: string = '';
  build() {
    NavDestination() {
      Text(this.info).id('infoId').height('5%')
      Button('push pageTwo').id('pushTwoId').onClick(() => {
        this.pageInfos.pushPath({name: 'pageTwo'} )
      }).height('10%')
      Button('push pageDialog').id('pushDialogId').onClick(() => {
        this.pageInfos.pushPath({name: 'pageDialog'} )
      }).height('10%')
    }
    .title('pageOne')
    .onResult((result: ESObject) => {
      this.info = result as string;
    })
  }
}

@Component
struct PageTwo {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick(() => {
        this.pageInfos.pop('test')
      });
      Button('popToIndex').id('popIndexId').onClick(() => {
        this.pageInfos.popToIndex(0, 'popToIndex')
      });
      Button('popToName').id('popNameId').onClick(() => {
        this.pageInfos.popToName('pageOne', 'popToName')
      });
      Button('popToNameUndefined').id('popUndefinedId').onClick(() => {
        this.pageInfos.popToName('pageOne', undefined)
      });
      Button('popToIndexNull').id('popNullId').onClick(() => {
        this.pageInfos.popToIndex(0, null)
      });
    }
    .title('pageTwo')
  }
}

@Component
struct PageThree {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('dialogPopId').onClick(() => {
        this.pageInfos.pop('test')
      });
      Button('popToIndex').id('dialogPopIndexId').onClick(() => {
        this.pageInfos.popToIndex(0, 'popToIndex')
      });
      Button('popToName').id('dialogPopNameId').onClick(() => {
        this.pageInfos.popToName('pageOne', 'popToName')
      });
    }
    .title('pageDialog')
    .mode(NavDestinationMode.DIALOG)
  }
}