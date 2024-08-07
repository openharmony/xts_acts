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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import bundleManager from '@ohos.bundle.bundleManager';
import Want from '@ohos.app.ability.Want';

const TAG = '[Orientation]';
const DOMAIN = 0x0000;
const BUNDLE = 'Acts_OrientationTest_';
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let cmd: string = "";
let testOrientationFollowRecentHapPath: string =
  '/data/OrientationTest/ActsBmsOrientationFollowRecentRelyHap.hap';
let testOrientationNotFollowRecentHapPath: string =
  '/data/OrientationTest/ActsBmsOrientationNotFollowRecentRelyHap.hap';
let testHapBundleName: string = "com.example.orientationtesthap";
let testHapActivityName: string = "EntryAbility";

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number     : Acts_OrientationTest_001
     * @tc.name       : The provider hap install.
     * @tc.desc       : install hap with orientation of follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '001 begin');
      cmd = 'bm install -p ' + testOrientationFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Install Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Install Hap failed: ${err}`);
        done();
      })
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

    /**
     * @tc.number     : Acts_OrientationTest_002
     * @tc.name       : The provider hap update.
     * @tc.desc       : update hap orientation from follow_recent to follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_002', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '002 begin');
      cmd = 'bm install -p ' + testOrientationFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap failed: ${err}`);
        done();
      })
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
      hilog.info(DOMAIN, TAG, BUNDLE + '002 end');
    })

    /**
     * @tc.number     : Acts_OrientationTest_003
     * @tc.name       : The provider hap update.
     * @tc.desc       : update hap orientation from follow_recent to not follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_003', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '003 begin');
      cmd = 'bm install -p ' + testOrientationNotFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap failed: ${err}`);
        done();
      })
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
      let userId = 100;
      let want: Want = {
        bundleName: testHapBundleName,
        abilityName: testHapActivityName
      };
      try {
        await bundleManager.queryAbilityInfo(want, abilityFlags, userId).then(data => {
          expect(data[0].orientation).assertEqual(bundleManager.DisplayOrientation.LANDSCAPE);
        });
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo successfully');
        done();
      } catch (err) {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo failed');
        done();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + '003 end');
    })

    /**
     * @tc.number     : Acts_OrientationTest_004
     * @tc.name       : The provider hap update.
     * @tc.desc       : update hap orientation from not follow_recent to not follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_004', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '004 begin');
      cmd = 'bm install -p ' + testOrientationNotFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap failed: ${err}`);
        done();
      })
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
      let userId = 100;
      let want: Want = {
        bundleName: testHapBundleName,
        abilityName: testHapActivityName
      };
      try {
        await bundleManager.queryAbilityInfo(want, abilityFlags, userId).then(data => {
          expect(data[0].orientation).assertEqual(bundleManager.DisplayOrientation.LANDSCAPE);
        });
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo successfully');
        done();
      } catch (err) {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo failed');
        done();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + '004 end');
    })

    /**
     * @tc.number     : Acts_OrientationTest_005
     * @tc.name       : The provider hap update.
     * @tc.desc       : update hap orientation from not follow_recent to follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_005', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '005 begin');
      cmd = 'bm install -p ' + testOrientationFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap failed: ${err}`);
        done();
      })
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
      hilog.info(DOMAIN, TAG, BUNDLE + '005 end');
    })

    /**
     * @tc.number     : Acts_OrientationTest_006
     * @tc.name       : The provider hap uninstall and install.
     * @tc.desc       : test uninstall and install orientation not follow_recent.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_006', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '006 begin');
      cmd = "bm uninstall -n com.example.orientationtesthap";
      await abilityDelegator.executeShellCommand(cmd);
      cmd = 'bm install -p ' + testOrientationNotFollowRecentHapPath;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand(cmd).then(result => {
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap successfully: ${result}`);
        done();
      }).catch((err: Error) => {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + `Update Hap failed: ${err}`);
        done();
      })
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
      let userId = 100;
      let want: Want = {
        bundleName: testHapBundleName,
        abilityName: testHapActivityName
      };
      try {
        await bundleManager.queryAbilityInfo(want, abilityFlags, userId).then(data => {
          expect(data[0].orientation).assertEqual(bundleManager.DisplayOrientation.LANDSCAPE);
        });
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo successfully');
        done();
      } catch (err) {
        expect().assertFail();
        hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAbilityInfo failed');
        done();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + '006 end');
    })
  })
}