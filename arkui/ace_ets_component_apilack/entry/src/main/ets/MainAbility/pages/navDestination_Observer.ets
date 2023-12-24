/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import observer from '@ohos.arkui.observer'

@Entry
@Component
struct NavDestinationObserver {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false

  aboutToAppear() {
    if (typeof this.queryNavDestinationInfo === 'function') {
        let info: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
    }
  }

  onPageShow() {

      //console.info('NavDestination state update', observer.NavDestinationState.ON_SHOWN);
      //console.info('NavDestination state update_Hidden', observer.NavDestinationState.ON_HIDDEN);
      observer.off('navDestinationUpdate', { navigationId: "testId" });

  }
  build() {
    Column() {
      Navigation() {
        NavRouter() {
          Row() {
            Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 }).backgroundColor(Color.Pink)
            Text(`WLAN`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)
          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用WLAN').fontSize(30).padding({ left: 15 })
            }
          }.hideTitleBar(false).backgroundColor('#0c182431')
        }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
        .borderRadius(24)
        .onStateChange((isActivated: boolean) => {
          this.isActiveWLAN = isActivated
        })

        NavRouter() {
          Row() {
            Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 }).backgroundColor(Color.Pink)
            Text(`蓝牙`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用蓝牙').fontSize(30).padding({ left: 15 })
            }
          }.hideTitleBar(false).backgroundColor('#0c182431')
        }.backgroundColor(this.isActiveBluetooth ? '#ccc' : '#fff')
        .borderRadius(24)
        .onStateChange((isActivated: boolean) => {
          this.isActiveBluetooth = isActivated
        })
      }
      .title('设置')
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true).key('navigation_observer')
    }.height('100%')
  }
}