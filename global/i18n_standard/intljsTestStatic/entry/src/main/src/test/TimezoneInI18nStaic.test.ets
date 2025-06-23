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
import Utils from './Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function TimezoneInI18nTest() {

  describe("TimezoneInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start TimezoneInI18nTest*************');
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
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_static_0100
    * @tc.name    timezone_test_static_0100
    * @tc.desc    get the getTimeZone value
   */
    it('timezone_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0100 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getID();
      console.log('timezone_test_static_0100 ' + value);
      expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2200
    * @tc.name timezone_test_static_2200
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_static_2200', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2200 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(116, 39);
        console.log('timezone_test_static_2200 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2200 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2200 e.code' + e.code);
        console.log('timezone_test_static_2200 e.message' + e.message);
      }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2300
    * @tc.name timezone_test_static_2300
    * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2300 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(87, 43);
        console.log('timezone_test_static_2300 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2300 ' + value[0].getID());
        console.log('timezone_test_static_2300 ' + value[1].getID());
        expect(value[0].getID()).assertEqual('CST');
        expect(value[1].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2300 e.code' + e.code);
        console.log('timezone_test_static_2300 e.message' + e.message);
      }
    })

    /* *
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2400
     * @tc.name timezone_test_static_2400
     * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2400 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(-74, 40);
        console.log('timezone_test_static_2400 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2400 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2400 e.code' + e.code);
        console.log('timezone_test_static_2400 e.message' + e.message);
      }
    })

    /* *
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2500
     * @tc.name timezone_test_static_2500
     * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2500 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(2, 49);
        console.log('timezone_test_static_2500 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2500 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2500 e.code' + e.code);
        console.log('timezone_test_static_2500 e.message' + e.message);
      }
    })

    /* *
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2600
     * @tc.name timezone_test_static_2600
     * @tc.desc get the getTimezonesByLocation value
    */
    it('timezone_test_static_2600', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2600 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(18, -33);
        console.log('timezone_test_static_2600 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2600 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2600 e.code' + e.code);
        console.log('timezone_test_static_2600 e.message' + e.message);
      }
    })
    console.log('*************end TimezoneInI18nTest*************');
  })
}