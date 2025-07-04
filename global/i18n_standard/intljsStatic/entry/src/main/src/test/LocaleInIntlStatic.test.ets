/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function LocaleInIntlTest() {

  describe("LocaleInIntlTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start i18nStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      resContext = abilityDelegator.getAppContext()
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });
    /* *
   * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0100
   * @tc.name    locale_test_static_0100
   * @tc.desc    test the language in en-Latn-GB locale
   */
    it('locale_test_static_0100', Level.LEVEL0, (): void => {
      let locale: intl.Locale = new intl.Locale('en-Latn-GB');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0100 ' + locale.language);
      expect(locale.language).assertEqual('en');
    })


    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0120
    * @tc.name    locale_test_static_0120
    * @tc.desc    test the language in en-Latn-GB locale
    */
    it('locale_test_static_0120', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('en-Latn-GB', undefined);
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0120 ' + locale.language);
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0120 ' + locale.numeric);
      expect(locale.language).assertEqual('en');
      expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0140
    * @tc.name    locale_test_static_0140
    * @tc.desc    test the language in locale
    */
    it('locale_test_static_0140', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale();
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0140 ' + locale.language);
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0140 ' + locale.numeric);
      expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0200
    * @tc.name    locale_test_static_0200
    * @tc.desc    test the language in ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji locale
    */
    it('locale_test_static_0200', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0200 ' + locale.language);
      expect(locale.language).assertEqual('ja');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0300
    * @tc.name    locale_test_static_0300
    * @tc.desc    test the script in locale
    */
    it('locale_test_static_0300', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('en-Latn-GB');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0300 ' + locale.script);
      expect(locale.script).assertEqual('Latn');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0400
    * @tc.name    locale_test_static_0400
    * @tc.desc    test the region in locale
    */
    it('locale_test_static_0400', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('en-Latn-GB');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0400 ' + locale.region);
      expect(locale.region).assertEqual('GB');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0500
    * @tc.name    locale_test_static_0500
    * @tc.desc    test the basename in locale
    */
    it('locale_test_static_0500', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('en-Latn-GB');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0500 ' + locale.baseName);
      expect(locale.baseName).assertEqual('en-Latn-GB');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0600
    * @tc.name    locale_test_static_0600
    * @tc.desc    test the basename in ja-Jpan-JP-u-ca-japanese-hc-h12
    */
    it('locale_test_static_0600', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0600 ' + locale.baseName);
      expect(locale.baseName).assertEqual('ja-Jpan-JP');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0700
    * @tc.name    locale_test_static_0700
    * @tc.desc   0test the hourCycle
    */
    it('locale_test_static_0700', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('zh-CN', {
        hourCycle: 'h24', calendar: 'gregory'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0700 ' + locale.hourCycle);
      expect(locale.hourCycle).assertEqual('h24');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0800
    * @tc.name    locale_test_static_0800
    * @tc.desc    test the calendar
    */
    it('locale_test_static_0800', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('zh-CN', {
        hourCycle: 'h24', calendar: 'gregory'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0800 ' + locale.calendar);
      expect(locale.calendar).assertEqual('gregory');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_0900
    * @tc.name    locale_test_static_0900
    * @tc.desc    ctest the japanese calendar
    */
    it('locale_test_static_0900', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_0900 ' + locale.calendar);
      expect(locale.calendar).assertEqual('japanese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1000
    * @tc.name    locale_test_static_1000
    * @tc.desc    check the h12 hourCycle
    */
    it('locale_test_static_1000', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1000 ' + locale.hourCycle);
      expect(locale.hourCycle).assertEqual('h12');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1100
    * @tc.name    locale_test_static_1100
    * @tc.desc    check the caseFirst
    */
    it('locale_test_static_1100', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        caseFirst: 'upper'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1100 ' + locale.caseFirst);
      expect(locale.caseFirst).assertEqual('upper');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1120
    * @tc.name    locale_test_static_1120
    * @tc.desc    check the caseFirst
    */
    it('locale_test_static_1120', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        caseFirst: 'lower'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1120 ' + locale.caseFirst);
      expect(locale.caseFirst).assertEqual('lower');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1140
    * @tc.name    locale_test_static_1140
    * @tc.desc    test the caseFirst with false
    */
    it('locale_test_static_1140', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        caseFirst: 'false'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1140 ' + locale.caseFirst);
      expect(locale.caseFirst).assertEqual('false');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1200
    * @tc.name    locale_test_static_1200
    * @tc.desc    test the collation
    */
    it('locale_test_static_1200', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        collation: 'big5han'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1200 ' + locale.collation);
      expect(locale.collation).assertEqual('big5han');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1300
    * @tc.name    locale_test_static_1300
    * @tc.desc    test the numeric with true value
    */
    it('locale_test_static_1300', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        numeric: true
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1300 ' + locale.numeric);
      expect(locale.numeric).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1350
    * @tc.name    locale_test_static_1350
    * @tc.desc    test the numeric with false value
    */
    it('locale_test_static_1350', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        numeric: false
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1350 ' + locale.numeric);
      expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1400
    * @tc.name    locale_test_static_1400
    * @tc.desc    test the numberingSystem
    */
    it('locale_test_static_1400', Level.LEVEL2, (): void => {
      let locale: intl.Locale = new intl.Locale('ja-Jpan-JP', {
        numberingSystem: 'arab'
      });
      hilog.info(domain, tag, '%{public}s', 'locale_test_static_1400 ' + locale.numberingSystem);
      expect(locale.numberingSystem).assertEqual('arab');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1500
    * @tc.name    locale_test_static_1500
    * @tc.desc    test the toString interface with zh
    */
    it('locale_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh');
      console.log('locale_test_static_1500 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1600
    * @tc.name    locale_test_static_1600
    * @tc.desc    test the toString interface with zh-CN
    */
    it('locale_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN');
      console.log('locale_test_static_1600 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1700
    * @tc.name    locale_test_static_1700
    * @tc.desc    test the toString interface with zh-Hans-CN
    */
    it('locale_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN');
      console.log('locale_test_static_1700 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1800
    * @tc.name    locale_test_static_1800
    * @tc.desc    test the toString interface with zh-Hans-CN-u-hc-h12-ca-japanese
    */
    it('locale_test_static_1800', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN-u-ca-japanese-hc-h12');
      console.log('locale_test_static_1800 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-Hans-CN-u-hc-h12-ca-japanese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_1900
    * @tc.name    locale_test_static_1900
    * @tc.desc    test the maximize interface with zh-u-ca-gregory-co-compact param
    */
    it('locale_test_static_1900', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_1900 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2000
    * @tc.name    locale_test_static_2000
    * @tc.desc    test the toString interface with zh-CN-u-ca-gregory-co-compact param
    */
    it('locale_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2000 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2100
    * @tc.name    locale_test_static_2100
    * @tc.desc    test the toString interface with zh-hans-CN-u-ca-gregory-co-compact param
    */
    it('locale_test_static_2100', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-hans-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2100 ' + locale.toString());
      expect(locale.toString()).assertEqual('zh-hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2200
    * @tc.name    locale_test_static_2200
    * @tc.desc    test the minimize interface with one param zh
    */
    it('locale_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh');
      console.log('locale_test_static_2200 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2201
    * @tc.name    locale_test_static_2201
    * @tc.desc    test the minimize interface with one param zh-CN
    */
    it('locale_test_static_2201', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN');
      console.log('locale_test_static_2201 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2202
    * @tc.name    locale_test_static_2202
    * @tc.desc    test the minimize interface with one param zh-Hans-CN
    */
    it('locale_test_static_2202', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN');
      console.log('locale_test_static_2202 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2203
    * @tc.name    locale_test_static_2203
    * @tc.desc    test the minimize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
    */
    it('locale_test_static_2203', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
      console.log('locale_test_static_2203 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2204
    * @tc.name    locale_test_static_2204
    * @tc.desc    test the minimize interface with zh lcoale
    */
    it('locale_test_static_2204', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2204 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2205
    * @tc.name    locale_test_static_2205
    * @tc.desc    test the minimize interface with zh-CN lcoale
    */
    it('locale_test_static_2205', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2205 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2206
    * @tc.name    locale_test_static_2206
    * @tc.desc    test the minimize interface with zh-Hans-CN lcoale
    */
    it('locale_test_static_2206', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-hans-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2206 ' + locale.minimize().toString());
      expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2300
    * @tc.name    locale_test_static_2300
    * @tc.desc    test the maximize interface with one param zh
    */
    it('locale_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh');
      console.log('locale_test_static_2300 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2301
    * @tc.name    locale_test_static_2301
    * @tc.desc    test the maximize interface with one param zh-CN
    */
    it('locale_test_static_2301', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN');
      console.log('locale_test_static_2301 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2302
    * @tc.name    locale_test_static_2302
    * @tc.desc    test the maximize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
    */
    it('locale_test_static_2302', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN');
      console.log('locale_test_static_2302 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2303
    * @tc.name    locale_test_static_2303
    * @tc.desc    test the maximize interface with zh-Hans-CN-u-ca-gregory-co-compact locale
    */
    it('locale_test_static_2303', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
      console.log('locale_test_static_2303 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2304
    * @tc.name    locale_test_static_2304
    * @tc.desc    test the maximize interface with zh locale
    */
    it('locale_test_static_2304', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2304 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2305
    * @tc.name    locale_test_static_2305
    * @tc.desc    test the maximize interface with zh-CN locale
    */
    it('locale_test_static_2305', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2305 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_static_2306
    * @tc.name    locale_test_static_2306
    * @tc.desc    test the maximize interface with zh-Hans-CN locale
    */
    it('locale_test_static_2306', Level.LEVEL2, async (): Promise<void> => {
      let locale = new intl.Locale('zh-Hans-CN', {
        calendar: 'gregory', collation: 'compact'
      });
      console.log('locale_test_static_2306 ' + locale.maximize().toString());
      expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })
    console.log('*************end I18NTest*************');
  })
}