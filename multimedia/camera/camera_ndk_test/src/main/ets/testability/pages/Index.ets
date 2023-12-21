/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import testsuite from '../../test/List.test';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { GlobalThis } from '../../test/Constants';

let TAG = 'CameraXts CameraModuleTest: ';
let mXComponentController: XComponentController = new XComponentController();
export let mContext = getContext(this) as common.Context;

@Entry
@Component
struct CameraIndex {
  @State mSurfaceId: string = GlobalThis.getInstance().getValue();

  aboutToAppear() {
    console.info(TAG + ' --------------aboutToAppear--------------');
  }

  build() {
    Flex() {
      XComponent({
        id: '',
        type: 'surface',
        libraryname: '',
        controller: mXComponentController
      })
        .onLoad(async () => {
          console.info(TAG + 'CameraModuleTest: OnLoad() is called!');
          mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 1920, surfaceHeight: 1080 });
          let surfaceId = mXComponentController.getXComponentSurfaceId();
          GlobalThis.getInstance().setValue(surfaceId);
          this.mSurfaceId = GlobalThis.getInstance().getValue();
          mContext = getContext(this);
          let permission = new Permission();
          permission.getPermission();
          console.info(TAG + 'CameraModuleTest: XComponent onLoad surfaceId: ' + surfaceId);

          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
          let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
          setTimeout(() => {
            console.log(TAG + 'delay 10s');
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
          }, 10000);
        })
        .width('1920px')
        .height('1080px')
    }
  }
}

class Permission {
  async getPermission(): Promise<void> {
    abilityAccessCtrl.createAtManager().requestPermissionsFromUser(mContext, [
      'ohos.permission.CAMERA',
      'ohos.permission.MICROPHONE',
      'ohos.permission.READ_MEDIA',
      'ohos.permission.WRITE_MEDIA'
    ]).then(() => {
    })
  }
}