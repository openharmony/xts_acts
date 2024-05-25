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
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node';

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Image($r('app.media.icon'))
        .key("top")
        .width(20).height(20)
        .position({ left: 0, top: 0 })
      Image($r('app.media.icon'))
        .key("bottom")
        .width(20).height(20)
        .position({ left: '100%', top: '100%' })
      Button('0100_ButtonA').onClick(() => {
      }).width(100)
        .key("0100_ButtonA")
        .position({ end: LengthMetrics.vp(100), top: LengthMetrics.vp(100) })
      Text('0200_TextA')
        .key("0200_TextA")
        .textAlign(TextAlign.Center)
        .width('20%')
        .position({ start: LengthMetrics.px(100), top: LengthMetrics.px(100) })
      Image($r('app.media.icon'))
        .key("0300_ImageA")
        .width(20).height(20)
        .position({ start: LengthMetrics.fp(300), bottom: LengthMetrics.fp(300) })
      Text('0400_TextB')
        .key("0400_TextB")
        .textAlign(TextAlign.Center)
        .width('20%')
        .position({ end: LengthMetrics.lpx(400), bottom: LengthMetrics.lpx(400) })
      Button('0500_ButtonB').onClick(() => {
      }).width(100)
        .key("0500_ButtonB")
        .position({ start: LengthMetrics.px(0), top: LengthMetrics.px(0) })
      Image($r('app.media.icon'))
        .key("0600_ImageB")
        .width(20).height(20)
        .position({ end: LengthMetrics.percent(0.5), bottom: LengthMetrics.percent(0.5) })
      Text('0700_TextC')
        .key("0700_TextC")
        .textAlign(TextAlign.Center)
        .width('20%')
        .position({ start: null, top: null })
      Button('0800_ButtonC').onClick(() => {
      }).width(100)
        .key("0800_ButtonC")
        .position({ start: undefined, top: undefined })
      Image($r('app.media.icon'))
        .key("0900_ImageC")
        .width(20).height(20)
        .position({ start: LengthMetrics.px(null), top: LengthMetrics.px(undefined) })
    }.height('100%').width('100%')
  }
}