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

export default function PluralRulesInIntlTest() {

  describe("PluralRulesInIntlTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start PluralRulesInIntlTest*************');
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
      * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_2600
      * @tc.name    pluralrules_test_static_2600
      * @tc.desc    get PluralRules check the select result
      */
    it('pluralrules_test_static_2600', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules();
      let value = pl.select(0);
      console.log('pluralrules_test_static_2600 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_2700
    * @tc.name    pluralrules_test_static_2700
    * @tc.desc    get PluralRules with zh locale check the select result
    */
    it('pluralrules_test_static_2700', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh');
      let value = pl.select(0);
      console.log('pluralrules_test_static_2700 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_2720
    * @tc.name    pluralrules_test_static_2720
    * @tc.desc    get PluralRules with zh locale and undefined options
    */
    it('pluralrules_test_static_2720', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', undefined);
      let value = pl.select(0);
      console.log('pluralrules_test_static_2720 ' + value);
      expect(value).assertEqual('other');
    })


    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_2800
    * @tc.name    pluralrules_test_static_2800
    * @tc.desc    get PluralRules with zh locale and ordinal type
    */
    it('pluralrules_test_static_2800', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'type': 'ordinal'
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_2800 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_2900
    * @tc.name    pluralrules_test_static_2900
    * @tc.desc    get PluralRules with zh locale and loolup localeMatcher
    */
    it('pluralrules_test_static_2900', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'localeMatcher': 'lookup'
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_2900 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_3000
    * @tc.name    pluralrules_test_static_3000
    * @tc.desc    get PluralRules with zh locale and minimumIntegerDigits options
    */
    it('pluralrules_test_static_3000', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'minimumIntegerDigits': 10
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_3000 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_3100
    * @tc.name    pluralrules_test_static_3100
    * @tc.desc    get PluralRules with zh locale and minimumFractionDigits options
    */
    it('pluralrules_test_static_3100', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'minimumFractionDigits': 11
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_3100 ' + value);
      expect(value).assertEqual('other');
    })

        
    /* *
    * @tc.number  pluralrules_test_static_3200
    * @tc.name    pluralrules_test_static_3200
    * @tc.desc    get PluralRules with zh locale and maximumFractionDigits options, check the select result
    */
    it('pluralrules_test_static_3200', Level.LEVEL0, async (): Promise<void> => {
      let pl = new intl.PluralRules('zh', {'maximumFractionDigits': 11});
      let value = pl.select(0);
      console.log('pluralrules_test_3200 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_3300
    * @tc.name    pluralrules_test_static_3300
    * @tc.desc    get PluralRules with zh locale and minimumSignificantDigits options
    */
    it('pluralrules_test_static_3300', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'minimumSignificantDigits': 10
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_3300 ' + value);
      expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_static_3400
    * @tc.name    pluralrules_test_static_3400
    * @tc.desc    get PluralRules with zh locale and maximumSignificantDigits options
    */
    it('pluralrules_test_static_3400', Level.LEVEL2, async (): Promise<void> => {
      let pl = new Intl.PluralRules('zh', {
        'maximumSignificantDigits': 11
      });
      let value = pl.select(0);
      console.log('pluralrules_test_static_3400 ' + value);
      expect(value).assertEqual('other');
    })
    console.log('*************end PluralRulesInIntlTest*************');
  })
}