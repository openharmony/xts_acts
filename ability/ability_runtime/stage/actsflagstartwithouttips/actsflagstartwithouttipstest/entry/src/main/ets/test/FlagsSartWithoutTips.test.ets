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

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll, beforeEach } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
let driver: Driver = Driver.create();
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context: common.UIAbilityContext;
let rectLeft: number;
let rectTop: number;
let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function flagstartwithouttipstest() {
  describe('FlagsSartWithoutTipsTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      console.log('ishave ishave driver', !!driver);
      try {
        let textComponent = await driver.findComponent(ON.id('TEST_PAGE_TEXT'));
        let rect = await textComponent.getBounds();
        rectLeft = rect.left;
        rectTop = rect.top;
      } catch (error) {
        console.log('get  rectLeft failed', JSON.stringify(error));
      }

    })
    beforeEach(async () => {
      await sleep(5000);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0100
     * @tc.name: Verify that the implicit startup application does not set flags and does not match the display popup
     * @tc.desc: A pop-up dialog box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0100', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0100';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let popupCorrect = false;
      let getCloseBtn = false;
      let wantInfo: Want = {
        action: 'action.want.notability.notability'
      };
      try {
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await sleep(10000);
      try {
        try {
          await driver.assertComponentExist(ON.text('暂无支持此类文件的应用')).then((data) => {
            hilog.info(0x0000, TAG, 'text at this success %{public}s', JSON.stringify(data));
            popupCorrect = true;
          })
        } catch (error) {
          hilog.info(0x0000, TAG, 'text at this failed %{public}s', error?.message);
        }
        if (!popupCorrect) {
          try {
            await driver.assertComponentExist(ON.text('无法打开此文件')).then((data) => {
              hilog.info(0x0000, TAG, 'text at it success %{public}s', JSON.stringify(data));
              popupCorrect = true;
            })
          } catch (error) {
            hilog.info(0x0000, TAG, 'text at it failed %{public}s', error?.message);
          }
        }
        await driver.findComponent(ON.text('知道了')).then(async (data) => {
          hilog.info(0x0000, TAG, ' %{public}s', 'findComponent success');
          await sleep(100);
          await data.click();
          getCloseBtn = true;
        }).catch(() => {
          hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
        })
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s get popup info error', JSON.stringify(error));
        expect().assertFail();
        done();
      }
      expect(popupCorrect).assertTrue();
      expect(getCloseBtn).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0200
     * @tc.name: Verify that the implicit startup application sets flags and does not display pop-ups if they do not match
     * @tc.desc: No information dialog box is displayed
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0200', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0200';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'action.want.notability.notability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      }
      try {
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }

      if (deviceType === '2in1') {
        await sleep(10000);
        let popupCorrect = false;
        let getCloseBtn = false;
        try {
          try {
            await driver.assertComponentExist(ON.text('暂无支持此类文件的应用')).then((data) => {
              hilog.info(0x0000, TAG, 'text at this success %{public}s', JSON.stringify(data));
              popupCorrect = true;
            })
          } catch (error) {
            hilog.info(0x0000, TAG, 'text at this failed %{public}s', error?.message);
          }
          await driver.findComponent(ON.text('知道了')).then(async (data) => {
            hilog.info(0x0000, TAG, ' %{public}s', 'findComponent success');
            await sleep(100);
            await data.click();
            getCloseBtn = true;
          }).catch(() => {
            hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s get popup info error', JSON.stringify(error));
          expect().assertFail();
          done();
        }
        expect(popupCorrect).assertTrue();
        expect(getCloseBtn).assertTrue();
        done();
      } else {
        await sleep(2000);
        let textComponent = await driver.findComponent(ON.id('TEST_PAGE_TEXT'));
        expect(!!textComponent).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0500
     * @tc.name: Verify that the implicit startup service does not set flags and does not display pop-ups
     * @tc.desc: Pop-up selection box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
    */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0500', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0500';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'com.acts.two.ability'
      };
      let popupCorrect = false;
      let getCloseBtn = false;
      try {
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await sleep(10000);
      try {
        try {
          await driver.assertComponentExist(ON.text('使用以下方式打开')).then((data) => {
            hilog.info(0x0000, TAG, '%{public}s text at it', JSON.stringify(data));
            popupCorrect = true;
          })
          await driver.findComponent(ON.text('取消')).then(async (data) => {
            await sleep(100);
            await data.click();
            getCloseBtn = true;
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s text at it', JSON.stringify(error));
        }
        if (!popupCorrect) {
          await driver.assertComponentExist(ON.text('选择打开方式')).then((data) => {
            hilog.info(0x0000, TAG, 'text at this success %{public}s', JSON.stringify(data));
            popupCorrect = true;
          })
          await driver.click(rectLeft, rectTop);
          await sleep(1000);
          let textComponent = await driver.findComponent(ON.id('TEST_PAGE_TEXT'));
          textComponent && (getCloseBtn = true);
        }
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s get popup info error', JSON.stringify(error));
        expect().assertFail();
        done();
      }
      await sleep(1000);
      expect(popupCorrect).assertTrue();
      expect(getCloseBtn).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0600
     * @tc.name: Verify that the implicit startup service sets flags and does not display pop-ups if they do not match
     * @tc.desc: Pop-up selection box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0600', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0600';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'com.acts.two.ability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      };
      let popupCorrect = false;
      let getCloseBtn = false;
      try {
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await sleep(10000);
      try {
        try {
          await driver.assertComponentExist(ON.text('使用以下方式打开')).then((data) => {
            hilog.info(0x0000, TAG, '%{public}s text at it', JSON.stringify(data));
            popupCorrect = true;
          })
          await driver.findComponent(ON.text('取消')).then(async (data) => {
            await sleep(100);
            await data.click();
            getCloseBtn = true;
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s text at it', JSON.stringify(error));
        }
        if (!popupCorrect) {
          await driver.assertComponentExist(ON.text('选择打开方式')).then((data) => {
            hilog.info(0x0000, TAG, 'text at this success %{public}s', JSON.stringify(data));
            popupCorrect = true;
          })
          await driver.click(rectLeft, rectTop);
          await sleep(1000);
          let textComponent = await driver.findComponent(ON.id('TEST_PAGE_TEXT'));
          textComponent && (getCloseBtn = true);
        }
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s get popup info error', JSON.stringify(error));
        expect().assertFail();
        done();
      }
      await sleep(1000);
      expect(popupCorrect).assertTrue();
      expect(getCloseBtn).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0700
     * @tc.name: Verify that the implicit startup application does not set flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0700', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0700';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      await abilityDelegator.executeShellCommand('aa start -b com.acts.flagstartwithouttipstest -a TestAbility');
      await sleep(3000);
      try {
        let wantInfo: Want = {
          action: 'ohos.want.onlyforwithouttips.onlyforwithouttips',
        }
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      await sleep(5000);
      let openViewData = false;
      try {
        await driver.findComponent(ON.text('ohos.want.action.viewData ability')).then(async (data) => {
          hilog.info(0x0000, TAG, 'text at this success %{public}s ', JSON.stringify(data));
          openViewData = true;
          await sleep(100);
          await data.click();
        }).catch(() => {
          hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
        })
      } catch (error) {
        hilog.info(0x0000, TAG, 'text at it failed %{public}s', error?.message);
        expect().assertFail();
        done();
      }
      expect(openViewData).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0800
     * @tc.name: Verify that the implicit startup application sets flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0800', 0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0800';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      await abilityDelegator.executeShellCommand('aa start -b com.acts.flagstartwithouttipstest -a TestAbility');
      await sleep(3000);
      try {
        let wantInfo: Want = {
          action: 'ohos.want.onlyforwithouttips.onlyforwithouttips',
          flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
        }
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      await sleep(5000);
      let openViewData = false;
      try {
        await driver.findComponent(ON.text('ohos.want.action.viewData ability')).then(async (data) => {
          hilog.info(0x0000, TAG, 'text at this success %{public}s ', JSON.stringify(data));
          openViewData = true;
          await sleep(100);
          await data.click();
        }).catch(() => {
          hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
        })
      } catch (error) {
        hilog.info(0x0000, TAG, 'text at it failed %{public}s', error?.message);
        expect().assertFail();
        done();
      }
      expect(openViewData).assertTrue();
      done();
    })
  })
}