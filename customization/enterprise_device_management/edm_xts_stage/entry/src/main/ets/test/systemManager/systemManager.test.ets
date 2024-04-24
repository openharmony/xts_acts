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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';

export default function systemManagerTest() {
  describe('systemManager_test', () => {
    testSetNTPSever();
    testGetNTPSever();
  })
}

function testSetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0100
   * @tc.name      : test_set_ntp_sever_0100
   * @tc.desc      : test systemManager setNTPServer without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setNTPServer(SELFWANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0100
   * @tc.name      : test_get_ntp_sever_0100
   * @tc.desc      : test systemManager getNTPServer without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.getNTPServer(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}