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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'
import { LabelInfo, Breadcrumb } from '@ohos.arkui.advanced.Breadcrumb'

@Entry
@Component
struct Index {
  @State breadcrumbWidth: number = 480;
  @State crumbs: Array<LabelInfo> = [
    { text: 'label0' },
    { text: 'label1' },
    { text: 'label2' },
    { text: 'label3' },
    { text: 'label4' },
    { text: 'label5' },
    { text: 'label6' },
    { text: 'label7' },
    { text: 'label8' },
  ]

  @State labelClickedMessage: string = ''

  onLabelClick(index: number) {
    this.labelClickedMessage = 'label ' + index + ' clicked'
  }
  onLabelDragStart() {}
  onLabelDragEnter() {}
  onLabelDragLeave() {}
  onLabelDrop() {}
  onLabelDragCancel() {}

  build() {
    Column() {
      Breadcrumb({
        labelInfo: $crumbs,
        onLabelClick: this.onLabelClick.bind(this),
        onLabelDragStart: this.onLabelDragStart.bind(this),
        onLabelDragEnter: this.onLabelDragEnter.bind(this),
        onLabelDragLeave: this.onLabelDragLeave.bind(this),
        onLabelDrop: this.onLabelDrop.bind(this),
        onLabelDragCancel: this.onLabelDragCancel.bind(this)
      }).width(this.breadcrumbWidth).height(40)

      Text(this.labelClickedMessage)

      Button('set width to 480').onClick(() => {
        this.breadcrumbWidth = 480
      })

      Button('set width to 1000').onClick(() => {
        this.breadcrumbWidth = 1000
      })
      .onAppear(() => {
        var abilityDelegator: any
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        var abilityDelegatorArguments: any
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
      })
    }
    .width('100%').height('100%')
  }
}