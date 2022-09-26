// @ts-nocheck
/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import configuration from '@system.configuration';
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets'

export default function configurationApiTest() {
  describe('configurationApiTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(1000);
      console.info("appVersionCode after each called");
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("appVersionCode after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         colorMode001
     * @tc.desic        aceColorMode001EtsTest0001
     */
    it('colorMode001', 0, async function (done) {
      console.info('colorMode001 test START');
      const localeInfo = configuration.getLocale();
      console.info("[configuration.getLocale] localeInfo: " + JSON.stringify(localeInfo));
      console.info("[configuration.getLocale] colorMode: " + localeInfo.colorMode);
      console.info("[configuration.getLocale] fontScale: " + localeInfo.fontScale);
      expect(localeInfo.colorMode).assertEqual('COLOR_MODE_LIGHT');
      expect(localeInfo.fontScale).assertEqual('ltr');
      console.info('testConfigurationGetLocale END');
      done();
    });
  })
}
