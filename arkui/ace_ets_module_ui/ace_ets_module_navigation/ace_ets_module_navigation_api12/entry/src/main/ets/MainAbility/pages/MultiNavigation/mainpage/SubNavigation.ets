/**
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import {
  MultiNavPathStack,
  MyNavPathStack,
  NeedRenderIsFullScreen,
  NeedRenderLeftClickCount,
  NeedRenderDisplayMode,
} from './MultiNavigation'
import hilog from '@ohos.hilog';
import display from '@ohos.display';
import { DeviceHelper } from './DeviceHelper';
import { NavWidthRangeAttrModifier } from './NavAttributeModifier';

@Component
export struct SubNavigation {
  @Link isPortrait: boolean;
  @State displayMode: number = 0;
  @ObjectLink multiStack: MultiNavPathStack
  @BuilderParam navDestination: (name: string, param?: object) => void;
  primaryStack: MyNavPathStack = new MyNavPathStack();
  @State secondaryStack: MyNavPathStack = new MyNavPathStack();
  @State primaryWidth: number | string = '50%';
  @ObjectLink needRenderIsFullScreen: NeedRenderIsFullScreen;
  @ObjectLink needRenderLeftClickCount: NeedRenderLeftClickCount;
  @ObjectLink navWidthRangeModifier: NavWidthRangeAttrModifier;
  @ObjectLink needRenderDisplayMode: NeedRenderDisplayMode;
  onNavigationModeChange?: (mode: NavigationMode) => void = (mode: NavigationMode) => {
  };

  @Builder
  SubNavDestination(name: string, param?: object) {
    this.navDestination(name, param);
  }

  getMode(): NavigationMode {
    hilog.debug(0x0000, 'MultiNavigation', 'SubNavigation getMode isFullScreen=' +
      this.needRenderIsFullScreen.isFullScreen + ', this.detailStack.size()=' + this.secondaryStack.size());
    this.displayMode = this.needRenderDisplayMode.displayMode;
    if (DeviceHelper.isPhone() && DeviceHelper.isStraightProduct()) {
      return NavigationMode.Stack;
    }
    if (this.displayMode === display.FoldStatus.FOLD_STATUS_UNKNOWN) {
      this.displayMode = display.getFoldStatus();
    }
    if (DeviceHelper.isTablet() && this.isPortrait) {
      hilog.info(0x0000, 'MultiNavigation', 'SubNavigation getMode tablet portrait');
      return NavigationMode.Stack;
    }
    if (this.needRenderIsFullScreen.isFullScreen == undefined) {
      if (DeviceHelper.isPhone()) {
        return this.secondaryStack.size() > 0 && DeviceHelper.isColumn() ? NavigationMode.Auto : NavigationMode.Stack;
      } else {
        return this.secondaryStack.size() > 0 ? NavigationMode.Auto : NavigationMode.Stack;
      }
    } else {
      return this.needRenderIsFullScreen.isFullScreen ? NavigationMode.Stack : NavigationMode.Auto;
    }
  }

  aboutToAppear(): void {
    hilog.info(0x0000, 'MultiNavigation', 'SubNavigation aboutToAppear param = ' + JSON.stringify(this.primaryStack));
  }

  build() {
    NavDestination() {
      Navigation(this.secondaryStack) {
        Navigation(this.primaryStack) {
        }
        .hideNavBar(true)
        .mode(NavigationMode.Stack)
        .navDestination(this.SubNavDestination)
        .hideTitleBar(true)
        .hideToolBar(true)
        .hideBackButton(true)
        .onTouch((event) => {
          if (event.type === TouchType.Down) {
            this.needRenderLeftClickCount.leftClickCount = 2;
          }
        })
      }
      .mode(this.getMode())
      .onNavigationModeChange(this?.onNavigationModeChange)
      .hideBackButton(true)
      .hideTitleBar(true)
      .navDestination(this.SubNavDestination)
      .navBarWidth(this.primaryWidth)
      .attributeModifier(this.navWidthRangeModifier)
      .onTouch((event) => {
        if (event.type === TouchType.Down) {
          hilog.info(0x0000, 'MultiNavigation', 'outer navigation this.outerStack.leftClickCount ' +
            this.needRenderLeftClickCount.leftClickCount);
          this.needRenderLeftClickCount.leftClickCount--;
        }
      })
    }
    .onBackPressed(() => {
      hilog.debug(0x0000, 'MultiNavigation', 'subNavigation NavDestination onBackPressed');
      if (this.multiStack && this.secondaryStack.size() === 1) {
        hilog.info(0x0000, 'MultiNavigation', 'subNavigation NavDestination onBackPressed multiStack.pop');
        this.multiStack.pop();
        return true;
      }
      return false;
    })
    .hideTitleBar(true)
  }
}