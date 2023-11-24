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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let driver: Driver = Driver.create();
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context: common.UIAbilityContext;

export default function flagstartwithouttipstest() {
  describe('FlagsSartWithoutTipsTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0100
     * @tc.name: Verify that the implicit startup application does not set flags and does not match the display popup
     * @tc.desc: A pop-up dialog box
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0100', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0100';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'action.want.notability.notability'
      };
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility()
          .then(ability => {
            hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
            try {
              expect().assertFail();
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            done();
          })
          .catch(async (error: string) => {
            hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
            try {
              expect(error).assertContain('16000100');
              await driver.assertComponentExist(ON.text('无法打开此文件')).then((data) => {
                hilog.info(0x0000, TAG, '%{public}s assertComponentExist', JSON.stringify(data));
              })
              await driver.findComponent(ON.text('知道了')).then(async (data) => {
                await data.click();
                done();
              })
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s assertComponentExist error', JSON.stringify(error));
              done();
            }
          })
      }, 1500);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0200
     * @tc.name: Verify that the implicit startup application sets flags and does not display pop-ups if they do not match
     * @tc.desc: No information dialog box is displayed
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0200', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0200';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'action.want.notability.notability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      }
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility()
          .then(ability => {
            hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
            try {
              expect(ability?.context?.abilityInfo?.name).assertEqual('TestAbility');
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            done();
          })
          .catch((error: string) => {
            hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
            try {
              expect().assertFail();
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            done();
          })
      }, 1500);
    })

    /**
   * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0500
   * @tc.name: Verify that the implicit startup service does not set flags and does not display pop-ups
   * @tc.desc: Pop-up selection box
   * @tc.level 3
   */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0500', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0500';
      hilog.info(0x0000, TAG, '%{public}s', '--start SUB_Ability_AbilityRuntime_startAbility_FLAG_0500');
      let wantInfo: Want = {
        action: 'com.acts.two.ability',
      }
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility().then(ability => {
          hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
          try {
            expect().assertFail();
          } catch (error) {
            hilog.info(0x0000, TAG, '%{public}s  getCurrentTopAbility error', JSON.stringify(error));
            done();
          }
        }).catch(async (error: string) => {
          hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
          try {
            expect(error).assertContain('16000100');
            await driver.assertComponentExist(ON.text('使用以下方式打开')).then((data) => {
              hilog.info(0x0000, TAG, '%{public}s assertComponentExist', JSON.stringify(data));
            })
            await driver.findComponent(ON.text('取消')).then(async (data) => {
              await data.click();
              done();
            })
          } catch (error) {
            hilog.info(0x0000, TAG, '%{public}s  assertComponentExist error', JSON.stringify(error));
          }
        })
      }, 1500);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0600
     * @tc.name: Verify that the implicit startup service sets flags and does not display pop-ups if they do not match
     * @tc.desc: Pop-up selection box
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0600', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0500';
      hilog.info(0x0000, TAG, '%{public}s', '--start SUB_Ability_AbilityRuntime_startAbility_FLAG_0600');
      let wantInfo: Want = {
        action: 'com.acts.two.ability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      }
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility().then(ability => {
          hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
          try {
            expect().assertFail();
          } catch (error) {
            hilog.info(0x0000, TAG, '%{public}s  getCurrentTopAbility getCurrentTopAbility', JSON.stringify(error));
            done();
          }
        }).catch(async (error: string) => {
          hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
          try {
            expect(error).assertContain('16000100');
            await driver.assertComponentExist(ON.text('使用以下方式打开')).then((data) => {
              hilog.info(0x0000, TAG, '%{public}s assertComponentExist', JSON.stringify(data));
            })
            await driver.findComponent(ON.text('取消')).then(async (data) => {
              await data.click();
              done();
            })
          } catch (error) {
            hilog.info(0x0000, TAG, '%{public}s  assertComponentExist error', JSON.stringify(error));
          }
        });
      }, 1500);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0700
     * @tc.name: Verify that the implicit startup application does not set flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0700', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0700';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'ohos.want.action.viewData',
      }
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility()
          .then(ability => {
            hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
            try {
              expect(ability?.context?.abilityInfo?.name).assertContain('EntryAbility1');
              expect(ability?.context?.abilityInfo?.bundleName).assertContain('com.acts.flagstartwithouttipstest');
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            ability.context.terminateSelf();
            done();
          })
          .catch((error: string) => {
            hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
            try {
              expect().assertFail();
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            done();
          })
      }, 1500);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0800
     * @tc.name: Verify that the implicit startup application sets flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0800', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0800';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'ohos.want.action.viewData',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      }
      context.startAbility(wantInfo);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility()
          .then(ability => {
            hilog.info(0x0000, TAG, '%{public}s', JSON.stringify(ability?.context?.abilityInfo));
            try {
              expect(ability?.context?.abilityInfo?.name).assertContain('EntryAbility1');
              expect(ability?.context?.abilityInfo?.bundleName).assertContain('com.acts.flagstartwithouttipstest');
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            ability.context.terminateSelf();
            done();
          })
          .catch((error: string) => {
            hilog.info(0x0000, TAG, '%{public}s error', JSON.stringify(error));
            try {
              expect().assertFail();
            } catch (error) {
              hilog.info(0x0000, TAG, '%{public}s getCurrentTopAbility error', JSON.stringify(error));
            }
            done();
          })
      }, 1500);
    })

  })
}