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

export default function RelativeTimeFormatInIntlTest() {

  describe("RelativeTimeFormatInIntlTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start RelativeTimeFormatInIntlTest*************');
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
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0100
    * @tc.name    i18n_test_relativetimeformat_0100
    * @tc.desc    format the relativetime with 100 second
    */
    it('i18n_test_relativetimeformat_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0100 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat();
      let value = relativetimefmt.format(100, 'second');
      console.log('i18n_test_relativetimeformat_0100 ' + value);
      expect(value).assertContain('100');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0200
    * @tc.name    i18n_test_relativetimeformat_0200
    * @tc.desc    format_0200format the relativetime with 100 second in en
    */
    it('i18n_test_relativetimeformat_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0200 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.format(100, 'second');
      console.log('i18n_test_relativetimeformat_0200 ' + value);
      expect(value !== null).assertTrue();
    })
    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0220
     * @tc.name    i18n_test_relativetimeformat_0220
     * @tc.desc    format the relativetime with 100 second in en and undefined options
     */
    it('i18n_test_relativetimeformat_0220', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0220 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en', undefined);
      let value = relativetimefmt.format(100, 'second');
      console.log('i18n_test_relativetimeformat_0220 ' + value);
      expect(value !== null).assertTrue();
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0240
     * @tc.name    i18n_test_relativetimeformat_0240
     * @tc.desc    format the relativetime with 100 second in en and null options
    */
    it('i18n_test_relativetimeformat_0240', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0240 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en', {});
      let value = relativetimefmt.format(100, 'second');
      console.log('i18n_test_relativetimeformat_0240 ' + value);
      expect(value !== null).assertTrue();
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0300
     * @tc.name    i18n_test_relativetimeformat_0300
     * @tc.desc    format the relativetime with 100 second in narrow style
    */
    it('i18n_test_relativetimeformat_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0300 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en', {
        style: 'narrow'
      });
      let value = relativetimefmt.format(100, 'second');
      console.log('i18n_test_relativetimeformat_0300 ' + value);
      expect(value).assertEqual('in 100 sec.');
    })

    /* *
    * @tc.number  i18n_test_relativetimeformat_static_0400
    * @tc.name    i18n_test_relativetimeformat_static_0400
    * @tc.desc    format the relativetime with 100 second, get the formatToParts value, check the formatToParts value
    */
    it('i18n_test_relativetimeformat_static_0400', Level.LEVEL0,  async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_static_0400 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.formatToParts(100,'second');
      console.log('i18n_test_relativetimeformat_static_0400 ' + value.length + 'value');
      expect(value.length>0).assertTrue();
    })
    
    /* *
    * @tc.number  i18n_test_relativetimeformat_static_0500
    * @tc.name    i18n_test_relativetimeformat_static_0500
    * @tc.desc    format the relativetime, get the locale options, check the relativetime
    */
    it('i18n_test_relativetimeformat_static_0500', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_static_0500 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.resolvedOptions();
      console.log('i18n_test_relativetimeformat_static_0500 ' + value);
      expect(value.locale).assertEqual('en');
    })  

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0600
     * @tc.name    i18n_test_relativetimeformat_0600
     * @tc.desc    format the relativetime, get the style options
    */
    it('i18n_test_relativetimeformat_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0600 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.resolvedOptions();
      console.log('i18n_test_relativetimeformat_0600 ' + value);
      expect(value !== null).assertTrue();
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0700
     * @tc.name    i18n_test_relativetimeformat_0700
     * @tc.desc    format the relativetime, get the numeric options
    */
    it('i18n_test_relativetimeformat_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0700 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.resolvedOptions();
      console.log('i18n_test_relativetimeformat_0700 ' + value);
      expect(value.numeric).assertEqual('always');
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0800
     * @tc.name    i18n_test_relativetimeformat_0800
     * @tc.desc    format the relativetime, get the numberingSystem options
    */
    it('i18n_test_relativetimeformat_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0800 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en');
      let value = relativetimefmt.resolvedOptions();
      console.log('i18n_test_relativetimeformat_0800 ' + value.numberingSystem);
      expect(value.numberingSystem).assertEqual('latn');
    })

    /* *
     * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0900
     * @tc.name    i18n_test_relativetimeformat_0900
     * @tc.desc    format the relativetime with localeMatcher options
    */
    it('i18n_test_relativetimeformat_0900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_relativetimeformat_0900 ' + 'start');
      let relativetimefmt = new intl.RelativeTimeFormat('en', {
        localeMatcher: 'best fit', numeric: 'auto', style: 'narrow'
      });
      let value = relativetimefmt.resolvedOptions();
      console.log('i18n_test_relativetimeformat_0900 ' + value);
      expect(value.numeric).assertEqual('auto');
      expect(value.style).assertEqual('narrow');
    })
    console.log('*************end RelativeTimeFormatInIntlTest*************');
  })
}