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

export default function PhoneNumberFormatInI18nTest() {

  describe("PhoneNumberFormatInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start PhoneNumberFormatInI18nTest*************');
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
    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0100
     * @tc.name i18n_phonenumberformat_test_static_0100
     * @tc.desc test isValidNumber interface with 13510574676 param
     */
    it('i18n_phonenumberformat_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0100 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0100 ' + ran);
      let valid = phonenumber.isValidNumber('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_0100 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0200
     * @tc.name i18n_phonenumberformat_test_static_0200
     * @tc.desc test isValidNumber interface with 13510574676 and undefined param
     */
    it('i18n_phonenumberformat_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0200 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', undefined);
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0200 ' + ran);
      let valid = phonenumber.isValidNumber('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_0200 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0300
     * @tc.name i18n_phonenumberformat_test_static_0300
     * @tc.desc test isValidNumber interface with 13510574676 and null param
     */
    it('i18n_phonenumberformat_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0300 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {});
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0300 ' + ran);
      let valid = phonenumber.isValidNumber('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_0300 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0400
     * @tc.name i18n_phonenumberformat_test_static_0400
     * @tc.desc test isValidNumber interface with 0755-6100088X param
     */
    it('i18n_phonenumberformat_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0400 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0400 ' + ran);
      let valid = phonenumber.isValidNumber('0755-6100088' + ran);
      console.log('i18n_phonenumberformat_test_static_0400 ' + valid);
      expect(valid).assertEqual(true);
    })


    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0600
     * @tc.name i18n_phonenumberformat_test_static_0600
     * @tc.desc test isValidNumber interface with 135 1057 4676 param
     */
    it('i18n_phonenumberformat_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0600 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0600 ' + ran);
      let valid = phonenumber.isValidNumber('135 1057 467' + ran);
      console.log('i18n_phonenumberformat_test_static_0600 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0700
     * @tc.name i18n_phonenumberformat_test_static_0700
     * @tc.desc test isValidNumber interface with +86 135 1057 4676 param
     */
    it('i18n_phonenumberformat_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0700 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0700 ' + ran);
      let valid = phonenumber.isValidNumber('+86 135 1057 467' + ran);
      console.log('i18n_phonenumberformat_test_static_0700 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0800
     * @tc.name i18n_phonenumberformat_test_static_0800
     * @tc.desc test isValidNumber interface with 135-1057-4676 param
     */
    it('i18n_phonenumberformat_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0800 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0800 ' + ran);
      let valid = phonenumber.isValidNumber('135-1057-467' + ran);
      console.log('i18n_phonenumberformat_test_static_0800 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0900
     * @tc.name i18n_phonenumberformat_test_static_0900
     * @tc.desc test isValidNumber interface with tel:+86-135-1057-4676 param
     */
    it('i18n_phonenumberformat_test_static_0900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0900 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0900 ' + ran);
      let valid = phonenumber.isValidNumber('tel:+86-135-1057-467' + ran);
      console.log('i18n_phonenumberformat_test_static_0900 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1000
     * @tc.name i18n_phonenumberformat_test_static_1000
     * @tc.desc test isValidNumber interface with 86-135-1057-4676 param
     */
    it('i18n_phonenumberformat_test_static_1000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1000 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1000 ' + ran);
      let valid = phonenumber.isValidNumber('86-135-1057-467' + ran);
      console.log('i18n_phonenumberformat_test_static_1000 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1100
     * @tc.name i18n_phonenumberformat_test_static_1100
     * @tc.desc test isValidNumber interface with +8613510574676 param
     */
    it('i18n_phonenumberformat_test_static_1100', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1100 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1100 ' + ran);
      let valid = phonenumber.isValidNumber('+861351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_1100 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1200
     * @tc.name i18n_phonenumberformat_test_static_1200
     * @tc.desc test isValidNumber interface with 8613510574676 param
     */
    it('i18n_phonenumberformat_test_static_1200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1200 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1200 ' + ran);
      let valid = phonenumber.isValidNumber('861351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_1200 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1300
     * @tc.name i18n_phonenumberformat_test_static_1300
     * @tc.desc test isValidNumber interface with 1351057467 param
     */
    it('i18n_phonenumberformat_test_static_1300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1300 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1300 ' + ran);
      let valid = phonenumber.isValidNumber('135105746' + ran);
      console.log('i18n_phonenumberformat_test_static_1300 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1400
     * @tc.name i18n_phonenumberformat_test_static_1400
     * @tc.desc test isValidNumber interface with 135105746761 param
     */
    it('i18n_phonenumberformat_test_static_1400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1400 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1400 ' + ran);
      let valid = phonenumber.isValidNumber('13510574676' + ran);
      console.log('i18n_phonenumberformat_test_static_1400 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1500
     * @tc.name i18n_phonenumberformat_test_static_1500
     * @tc.desc test isValidNumber interface with 1351057467a param
     */
    it('i18n_phonenumberformat_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1500 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1500 ' + ran);
      let valid = phonenumber.isValidNumber('135105746' + ran + 'a');
      console.log('i18n_phonenumberformat_test_static_1500 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1600
     * @tc.name i18n_phonenumberformat_test_static_1600
     * @tc.desc get the isValidNumber value
     */
    it('i18n_phonenumberformat_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1600 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1600 ' + ran);
      let valid = phonenumber.isValidNumber('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_1600 ' + valid);
      expect(valid).assertEqual(true);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1700
     * @tc.name i18n_phonenumberformat_test_static_1700
     * @tc.desc test isValidNumber interface with 626202337 param
     */
    it('i18n_phonenumberformat_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1700 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1700 ' + ran);
      let valid = phonenumber.isValidNumber('62620233' + ran);
      console.log('i18n_phonenumberformat_test_static_1700 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1800
     * @tc.name i18n_phonenumberformat_test_static_1800
     * @tc.desc test isValidNumber interface with 62620233791 param
     */
    it('i18n_phonenumberformat_test_static_1800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1800 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1800 ' + ran);
      let valid = phonenumber.isValidNumber('6262023379' + ran);
      console.log('i18n_phonenumberformat_test_static_1800 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_1900
     * @tc.name i18n_phonenumberformat_test_static_1900
     * @tc.desc test isValidNumber interface with 626202337a param
     */
    it('i18n_phonenumberformat_test_static_1900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_1900 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_1900 ' + ran);
      let valid = phonenumber.isValidNumber('62620233' + ran + 'a');
      console.log('i18n_phonenumberformat_test_static_1900 ' + valid);
      expect(valid).assertEqual(false);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2000
     * @tc.name i18n_phonenumberformat_test_static_2000
     * @tc.desc test format interface with 13510574676 param
     */
    it('i18n_phonenumberformat_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2000 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2000 ' + ran);
      let value = phonenumber.format('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_2000 ' + value);
      expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2100
     * @tc.name i18n_phonenumberformat_test_static_2100
     * @tc.desc test format interface with 6262023379 param
     */
    it('i18n_phonenumberformat_test_static_2100', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2100 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2100 ' + ran);
      let value = phonenumber.format('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_2100 ' + value);
      expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2200
     * @tc.name i18n_phonenumberformat_test_static_2200
     * @tc.desc test format interface with 13510574676 and NATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2200 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'NATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2200 ' + ran);
      let value = phonenumber.format('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_2200 ' + value);
      expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2300
     * @tc.name i18n_phonenumberformat_test_static_2300
     * @tc.desc test format interface with 1351057467 and NATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2300 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'NATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2300 ' + ran);
      let value = phonenumber.format('135105746' + ran);
      console.log('i18n_phonenumberformat_test_static_2300 ' + value);
      expect(value).assertEqual('135105746' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2400
     * @tc.name i18n_phonenumberformat_test_static_2400
     * @tc.desc test format interface with 135105746761 and NATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2400 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'NATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2400 ' + ran);
      let value = phonenumber.format('13510574676' + ran);
      console.log('i18n_phonenumberformat_test_static_2400 ' + value);
      expect(value).assertEqual('013 510 574 676' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2500
     * @tc.name i18n_phonenumberformat_test_static_2500
     * @tc.desc test format interface with 135 1057 4676 and NATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2500 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'NATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2500 ' + ran);
      let value = phonenumber.format('135 1057 467' + ran);
      console.log('i18n_phonenumberformat_test_static_2500 ' + value);
      expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2600
     * @tc.name i18n_phonenumberformat_test_static_2600
     * @tc.desc test format interface with 13510574676 and INTERNATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2600 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'INTERNATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2600 ' + ran);
      let value = phonenumber.format('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_2600 ' + value);
      expect(value).assertEqual('+86 135 1057 467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2700
     * @tc.name i18n_phonenumberformat_test_static_2700
     * @tc.desc test format interface with 13510574676 and RFC3966 type param
     */
    it('i18n_phonenumberformat_test_static_2700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2700 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'RFC3966'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2700 ' + ran);
      let value = phonenumber.format('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_2700 ' + value);
      expect(value).assertEqual('tel:+86-135-1057-467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2800
     * @tc.name i18n_phonenumberformat_test_static_2800
     * @tc.desc test format interface with 13510574676 and E164 type param
     */
    it('i18n_phonenumberformat_test_static_2800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2800 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', {
        'type': 'E164'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2800 ' + ran);
      let value = phonenumber.format('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_2800 ' + value);
      expect(value).assertEqual('+861351057467' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_2900
     * @tc.name i18n_phonenumberformat_test_static_2900
     * @tc.desc test format interface with 6262023379 and NATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_2900', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_2900 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US', {
        'type': 'NATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_2900 ' + ran);
      let value = phonenumber.format('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_2900 ' + value);
      expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_3000
     * @tc.name i18n_phonenumberformat_test_static_3000
     * @tc.desc test format interface with 6262023379 and INTERNATIONAL type param
     */
    it('i18n_phonenumberformat_test_static_3000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_3000 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US', {
        'type': 'INTERNATIONAL'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_3000 ' + ran);
      let value = phonenumber.format('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_3000 ' + value);
      expect(value).assertEqual('+1 626-202-337' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_3100
     * @tc.name i18n_phonenumberformat_test_static_3100
     * @tc.desc test format interface with 6262023379 and RFC3966 type param
     */
    it('i18n_phonenumberformat_test_static_3100', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_3100 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US', {
        'type': 'RFC3966'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_3100 ' + ran);
      let value = phonenumber.format('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_3100 ' + value);
      expect(value).assertEqual('tel:+1-626-202-337' + ran);
    })

    /**
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_3200
     * @tc.name i18n_phonenumberformat_test_static_3200
     * @tc.desc test format interface with 6262023379 and E164 type param
     */
    it('i18n_phonenumberformat_test_static_3200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_3200 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('US', {
        'type': 'E164'
      });
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_3200 ' + ran);
      let value = phonenumber.format('626202337' + ran);
      console.log('i18n_phonenumberformat_test_static_3200 ' + value);
      expect(value).assertEqual('+1626202337' + ran);
    })

    console.log('*************end PhoneNumberFormatInI18nTest*************');
  })
}