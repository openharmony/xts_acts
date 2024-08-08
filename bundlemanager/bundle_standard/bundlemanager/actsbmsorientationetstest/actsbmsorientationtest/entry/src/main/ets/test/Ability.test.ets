/*
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import Want from '@ohos.app.ability.Want';

const TAG = '[Orientation]';
const DOMAIN = 0x0000;
const BUNDLE = 'Acts_OrientationTest_';
let testHapBundleName: string = "com.example.orientationtesthap";
let testHapActivityName: string = "EntryAbility";

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number     : Acts_OrientationTest_001
     * @tc.name       : Query the orientation of the provided HAP
     * @tc.desc       : Query if the orientation value is FOLLOW_RECENT.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '001 begin');
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
      let userId = 100;
      let want: Want = {
        bundleName: testHapBundleName,
        abilityName: testHapActivityName
      };
      try {
        await bundleManager.queryAbilityInfo(want, abilityFlags, userId).then(data => {
          expect(data[0].orientation).assertEqual(bundleManager.DisplayOrientation.FOLLOW_RECENT);
        });
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo successfully');
        done();
      } catch (err) {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo failed');
        done();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + '001 end');
    })
  })
}