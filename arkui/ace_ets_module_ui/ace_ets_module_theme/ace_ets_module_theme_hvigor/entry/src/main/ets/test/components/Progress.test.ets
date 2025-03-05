/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { ProgressKeys, progressThemeProperty } from '../../MainAbility/pages/components/ProgressPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function progressThemeTest() {
  const SUITE: string = `ProgressThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ProgressPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `ProgressPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(progressThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(progressThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(progressThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(progressThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(progressThemeProperty);
      changeTheme = false;
    });

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsProgressThemeColors_0100
      * @tc.name      : ActsProgressThemeColors_0100
      * @tc.desc      : Check system colors values of Linear Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0100`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0100`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressLinearSystem)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`progressTrackColor`)?.toString().toUpperCase() ?? emptyCheck
      console.info('WANGSIHAN1 is:' + backgroundColor);
      console.info('WANGSIHAN2 is:' + checkBackgroundColor);
      expect(color).assertEqual(checkColor)
      // expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0200
      * @tc.name      : ActsProgressThemeColors_0200
      * @tc.desc      : Check system colors values of Ring Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0200`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressRingSystem)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase() ?? emptyCheck
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0300
      * @tc.name      : ActsProgressThemeColors_0300
      * @tc.desc      : Check system colors values of Eclipse Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0300`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressEclipseSystem)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`progressTrackColor`)?.toString().toUpperCase() ?? emptyCheck
      console.info('WANGSIHAN3 is:' + backgroundColor);
      console.info('WANGSIHAN4 is:' + checkBackgroundColor);
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0400
      * @tc.name      : ActsProgressThemeColors_0400
      * @tc.desc      : Check system colors values of Scale Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0400`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0400`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressScaleSystem)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`progressTrackColor`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0500
      * @tc.name      : ActsProgressThemeColors_0500
      * @tc.desc      : Check system colors values of Capsule Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0500`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0500`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressCapsuleSystem)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`compEmphasizeSecondary`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0600
      * @tc.name      : ActsProgressThemeColors_0600
      * @tc.desc      : Check undefined custom colors values of Linear Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0600`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0600`
      console.info(`${SUITE} ${CASE} START`);
      const progressJSON = getInspectorByKey(ProgressKeys.progressLinearUndefinedTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`backgroundEmphasize`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0700
      * @tc.name      : ActsProgressThemeColors_0700
      * @tc.desc      : Check undefined custom colors values of Ring Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0700`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0700`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressRingUndefinedTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase() ?? emptyCheck
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0800
      * @tc.name      : ActsProgressThemeColors_0800
      * @tc.desc      : Check undefined custom colors values of Eclipse Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0800`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0800`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressEclipseUndefinedTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`backgroundEmphasize`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_0900
      * @tc.name      : ActsProgressThemeColors_0900
      * @tc.desc      : Check undefined custom colors values of Scale Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_0900`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_0900`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressScaleUndefinedTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1000
      * @tc.name      : ActsProgressThemeColors_1000
      * @tc.desc      : Check undefined custom colors values of Capsule Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1000`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1000`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressCapsuleUndefinedTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr
      const checkColor: string = colorValues?.get(`compEmphasizeSecondary`)?.toString().toUpperCase() ?? emptyCheck
      expect(color).assertEqual(checkColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1100
      * @tc.name      : ActsProgressThemeColors_1100
      * @tc.desc      : Check custom colors values of Linear Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1100`, 0, async () => {
      const CASE: string = `ActsProgressThemeColors_1100`
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      const progressJSON = getInspectorByKey(ProgressKeys.progressLinearTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1200
      * @tc.name      : ActsProgressThemeColors_1200
      * @tc.desc      : Check custom colors values of Ring Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1200`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1200`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressRingTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1300
      * @tc.name      : ActsProgressThemeColors_1300
      * @tc.desc      : Check custom colors values of Eclipse Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1300`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1300`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressEclipseTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1400
      * @tc.name      : ActsProgressThemeColors_1400
      * @tc.desc      : Check custom colors values of Scale Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1400`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1400`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressScaleTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1500
      * @tc.name      : ActsProgressThemeColors_1500
      * @tc.desc      : Check custom colors values of Capsule Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1500`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1500`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressCapsuleTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1600
      * @tc.name      : ActsProgressThemeColors_1600
      * @tc.desc      : Check custom colors values of Linear Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1600`, 0, async () => {
      const CASE: string = `ActsProgressThemeColors_1600`
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      const progressJSON = getInspectorByKey(ProgressKeys.progressLinearTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1700
      * @tc.name      : ActsProgressThemeColors_1700
      * @tc.desc      : Check custom colors values of Ring Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1700`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1700`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressRingTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1800
      * @tc.name      : ActsProgressThemeColors_1800
      * @tc.desc      : Check custom colors values of Eclipse Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1800`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1800`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressEclipseTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_1900
      * @tc.name      : ActsProgressThemeColors_1900
      * @tc.desc      : Check custom colors values of Scale Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_1900`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_1900`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressScaleTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = colorValues?.get(`progressTrackSelectedColor`)?.toString().toUpperCase() ?? emptyCheck;
      const backgroundColor: string = attrsProgress?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      expect(backgroundColor).assertEqual(checkBackgroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsProgressThemeColors_2000
      * @tc.name      : ActsProgressThemeColors_2000
      * @tc.desc      : Check custom colors values of Capsule Progress component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsProgressThemeColors_2000`, 0, () => {
      const CASE: string = `ActsProgressThemeColors_2000`
      console.info(`${SUITE} ${CASE} START`)
      const progressJSON = getInspectorByKey(ProgressKeys.progressCapsuleTheme)
      const attrsProgress = (JSON.parse(progressJSON)?.$attrs as ProgressAttribute)
      const color: string = attrsProgress?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.compEmphasizeSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor)
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
    })
  })
}