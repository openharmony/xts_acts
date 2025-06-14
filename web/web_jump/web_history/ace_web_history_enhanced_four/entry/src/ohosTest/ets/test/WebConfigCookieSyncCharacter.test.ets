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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webConfigCookieSyncCharacter() {

  describe('webConfigCookieSyncCharacterTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webConfigCookieSyncCharacter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webConfigCookieSyncCharacter state success ' + JSON.stringify(pages));
        if (!('webConfigCookieSyncCharacter' == pages.name)) {
          console.info('get webConfigCookieSyncCharacter state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push webConfigCookieSyncCharacter page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webConfigCookieSyncCharacter page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info('webConfigCookieSyncCharacter beforeEach start');
      done();
    })

    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0100
     * @tc.name       : testConfigCookieSyncCharacter001
     * @tc.desc       : test configCookieSync \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieSyncCharacter001', 'a=b', 2025060412, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0200
     * @tc.name       : testConfigCookieSyncCharacter002
     * @tc.desc       : test configCookieSync \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncCharacter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncCharacter002', 10);
      Utils.registerBaseEvent('testConfigCookieSyncCharacter002', '17100005', 2025060413, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0300
     * @tc.name       : testConfigCookieSyncCharacter003
     * @tc.desc       : test configCookieSync \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncCharacter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncCharacter003', 10);
      Utils.registerBaseEvent('testConfigCookieSyncCharacter003', 'a=b', 2025060414, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_CHARACTER_0400
     * @tc.name       : testConfigCookieSyncCharacter004
     * @tc.desc       : test configCookieSync \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncCharacter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncCharacter004', 10);
      Utils.registerBaseEvent('testConfigCookieSyncCharacter004', 'a=b', 2025060415, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.name       : testConfigCookieSyncIncludeHttpOnlyCharacter001
     * @tc.desc       : test configCookieSync includeHttpOnly \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncludeHttpOnlyCharacter001', 'a=b,HttpOnly', 2025060416, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0200
     * @tc.name       : testConfigCookieSyncIncludeHttpOnlyCharacter002
     * @tc.desc       : test configCookieSync includeHttpOnly \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter002', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncludeHttpOnlyCharacter002', '17100005', 2025060417, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0300
     * @tc.name       : testConfigCookieSyncIncludeHttpOnlyCharacter003
     * @tc.desc       : test configCookieSync includeHttpOnly \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter003', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncludeHttpOnlyCharacter003', 'a=b,HttpOnly', 2025060418, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCLUDEHTTPONLY_CHARACTER_0400
     * @tc.name       : testConfigCookieSyncIncludeHttpOnlyCharacter004
     * @tc.desc       : test configCookieSync includeHttpOnly \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncludeHttpOnlyCharacter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncludeHttpOnlyCharacter004', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncludeHttpOnlyCharacter004', 'a=b,HttpOnly', 2025060419, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCOGNITO_CHARACTER_0100
     * @tc.name       : testConfigCookieSyncIncognitoCharacter001
     * @tc.desc       : test configCookieSync incognito \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncognitoCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncognitoCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncognitoCharacter001', 'a=b', 2025060420, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIESYNC_INCOGNITO_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.name       : testConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001
     * @tc.desc       : test configCookieSync incognito includeHttpOnly \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001', 'a=b,HttpOnly', 2025060421, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieSyncCharacterButton', 10, '');
    })

  })
}
