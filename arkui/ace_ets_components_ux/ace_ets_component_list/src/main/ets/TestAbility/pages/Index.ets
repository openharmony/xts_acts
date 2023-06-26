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
 // @ts-nocheck
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Curves from '@ohos.curves';
@Entry
@Component
struct Index {
  private scrollerForList: Scroller = new Scroller()
  @State message: string = 'Hello World'
  aboutToAppear(){
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }
  build() {
    Row() {
      Column() {
        List({ space: "4vp", initialIndex: 0 ,scroller: this.scrollerForList }) {
          ListItem(){
             Button("scrollTo自定义弹簧曲线测试(Curves.springCurve(7, 1, 227, 33))")
              .key("scrollerForList")
              .onClick(() => {
                let curve = Curves.springCurve(7, 1, 227, 33)
                this.scrollerForList.scrollTo({ xOffset: 0,
                                                yOffset: this.scrollerForList.currentOffset().yOffset + 600,
                                                animation:true })
              })
              .height(45)
              .width('80%')
              .fontSize(13)
          }
        }
        .key("RollBack")
        .multiSelectable(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}